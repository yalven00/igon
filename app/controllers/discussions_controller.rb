class DiscussionsController < ApplicationController
  before_filter :confirm_logged_in
  layout false

  before_filter :prepare_community
  before_filter :prepare_public_discussions, :only => [:index, :destroy, :create, :show]
  before_filter :prepare_private_discussions, :only => [:index, :create, :show]
  before_filter :prepare_new_discussion, :only => [:index, :create, :show, :destroy]

  PAGE = 5
  def index
    @more_section = params[:more]
  end

  def create
    if params[:comment][:public] == 'true'
      @public_number
      public = true
    else
      @private_number
      public = false
    end

    @comment = Comment.build_from( @community, current_user.id, params[:comment][:body], public, params[:comment][:parent_id])
    unless params[:comment][:parent_id].blank?
      @parent_comment = Comment.find_by_id(params[:comment][:parent_id])
      @child_comments = @parent_comment.children.order("created_at DESC")
      # @child_comments = @parent_comment.children.order("replies DESC ,created_at DESC")
    end

    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js
      end
    end
  end

  def show
    @page = params[:page]
    @parent_comment = Comment.find_by_id(params[:id])
    @child_comments = @parent_comment.children.order("created_at DESC")
  end

  def destroy
    @parent_comment = Comment.find_by_id(params[:id])
    if @parent_comment.has_children?
      @parent_comment.children.each do |child|
        child.update_attributes(:removed => true)
        child.update_attributes(:replies => @parent_comment.replies-1) if @parent_comment.replies > 0
      end
    end
    @parent_comment.update_attributes(:removed => true)
    @parent_id = @parent_comment.id
    respond_to do |format|
      format.js
    end
  end

  private

  def prepare_community
    @community = Community.find(params[:community_id])
  end

  def prepare_public_discussions
    # @public_discussions = @community.root_comments.where(:public => true, :removed => false).order("created_at DESC, order_number ASC").page(params[:page]).per_page(PAGE)
    @public_discussions = @community.root_comments.where(:public => true, :removed => false).order("replies DESC ,created_at DESC").page(params[:page]).per_page(PAGE)

  end

  def prepare_private_discussions
    # @private_discussions = @community.root_comments.where(:public => false, :removed => false).order("created_at DESC, order_number ASC").page(params[:page]).per_page(PAGE)
    @private_discussions = @community.root_comments.where(:public => false, :removed => false).order("replies DESC, created_at DESC").page(params[:page]).per_page(PAGE)
  end

  def prepare_new_discussion
    @discussion = Comment.new
  end

end