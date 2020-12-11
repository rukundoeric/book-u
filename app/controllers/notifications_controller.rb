class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.ordered_by_most_recent
    @users_to_follow = User.where('id NOT IN (?)', current_user.followings.ids << current_user.id)
  end
end
