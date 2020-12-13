class NotificationsController < ApplicationController
  before_action :require_login

  def index
    @notifications = current_user.notifications.eager_loading.ordered_by_most_recent
    @users_to_follow = User.where('id NOT IN (?)', current_user.followings.ids << current_user.id)
      .eager_loading.ordered_by_most_recent
  end
end
