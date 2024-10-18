class GalleriesController < ApplicationController
  before_filter :confirm_logged_in
  layout false

  def show
    @community = Community.with_images.find_by_id(params[:community_id])
    @item = params[:id]
  end

end
