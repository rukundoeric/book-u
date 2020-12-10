class FollowingsController < ApplicationController
  before_action :require_login
  before_action :set_following, only: %i[destroy]

  def create
    @following = Following.new(follower_id: current_user.id, followed_id: params[:followed_id])
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @following.save
    send_notification('follow', params[:followed_id])
    # redirect_to controller: 'notifications', action: 'send_nofification', type: 'follow', receiver: params[:followed_id], redirec: 
    # redirect_to send_nofification_path(type: 'follow', receiver: params[:followed_id], redirec: request.referer, method: 'post')
    redirect_to request.referer
  end

  def destroy
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @following.destroy
    redirect_to request.referer
  end

  private

  def set_following
    @following = Following.find_by(follower_id: params[:follower_id], followed_id: params[:followed_id])
  end
end
