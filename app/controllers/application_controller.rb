class ApplicationController < ActionController::Base
  def require_login
    redirect_to sign_in_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def send_notification(type, receiver = nil)
    case type
    when 'follow'
      user = User.find(receiver)
      notification = user.notifications
        .build(title: 'Following', content: "#{current_user.fullname} started following you!")
      if notification.save
        ActionCable.server.broadcast 'room_channel', title: notification.title, content: notification.content
      end
    when 'new_opinion'
      current_user.followers.each do |u|
        u.notifications
          .build(title: 'New Opinion',
                 content: "#{current_user.fullname} posted an opinion you may be interested in!").save
      end
    end
  end

  helper_method :current_user
end
