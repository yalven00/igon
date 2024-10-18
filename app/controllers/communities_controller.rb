class CommunitiesController < ApplicationController
  before_filter :confirm_logged_in
  before_filter :prepare_community, :only => [:connections, :showcases, :get_admins, :get_offers, :add_to_wishlist]
  layout false

  def show
    @community = Community.with_images.find_by_id(params[:id])

    @community_images = @community.images.limit(3)
    # @community_videos = []

    @connections = @community.account_users.sample(5)

    @top_offers = Product.includes(:account_user).joins("left join community_memberships on community_memberships.community_id=#{params[:id]}").where('community_memberships.approved is true').sample(5)
    @showcase = @top_offers.sample(4)

    @admins = @connections
    @number_of_discussion =@community.comment_threads.size
  end

  # a user to the community membership
  def request_membership
    @community = Community.with_images.find_by_id(params[:id])
    member = CommunityMembership.where(:account_user_id => current_user.id, :community_id => @community.id)
    @membership = CommunityMembership.new(:community_id => params[:id], :account_user_id => current_user.id) if member.blank?
    respond_to do |format|
      if member.blank? && @membership.save
        format.html { redirect_to community_membershipsath(@community.id), notice: 'Successfully created' }
        format.js
      else
        format.html { redirect_to community_path(@community.id), error: 'Failed created' }
        format.js
      end
    end
  end

  def get_admins
    @admin = AccountUser.find_by_id(params[:id])
  end

  def get_offers
    @offer = Product.find_by_id(params[:id])
  end

  def showcases
  end

  def connections
    @connections = @community.account_users.search(params[:search])
  end

  def add_to_wishlist
    @wishing = Wishing.new
    @wishing.account_user_id = current_user.id
    @wishing.community_id = @community.id
    @wishing.product_id = params[:product_id]
    respond_to do |format|current_user.membership(@community.id)
      if @wishing.save
        format.html { redirect_to community_path(@community.id), notice: 'Successfully created' }
        format.js
      else
        format.html { redirect_to community_path(@community.id), error: 'Failed created' }
        format.js
      end
    end
  end

  private

  def prepare_community
    @community = Community.with_images.find_by_id(params[:community_id])
  end


end