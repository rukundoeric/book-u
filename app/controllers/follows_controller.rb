class FollowsController < ApplicationController
  before_action :require_login
  before_action :set_follow, only: %i[destroy]

  def create
    @follow = Follow.new(user_id: current_user.id, follow_id: params[:follow_id])
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @follow.save
    redirect_to request.referer
  end

  def destroy
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @follow.destroy
  end

  private

  def set_follow
    @follow = Follow.find_by(user_id: current_user.id, follow_id: params[:follow_id])
  end
end
