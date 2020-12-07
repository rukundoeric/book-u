class FollowingsController < ApplicationController
  before_action :require_login
  before_action :set_following, only: %i[destroy]

  def create
    @following = Following.new(follower_id: current_user.id, followed_id: params[:followed_id])
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @following.save
    redirect_to request.referer
  end

  def destroy
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @following.destroy
  end

  private

  def set_following
    @follow = Following.find_by(follower_id: current_user.id, followed_id: params[:followed_id])
  end
end
