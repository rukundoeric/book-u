module ApplicationHelper
  def active(active_view)
    if controller_name == active_view
      'active'
    else
      ''
    end
  end

  def profile_image(user, d_style)
    if user.photo.exists?
      image_tag user.photo.url, class: "#{d_style} ml-3"
    else
      content_tag :div, nil, class: 'no_image d-flex justify-content-center align-items-center ml-3' do
        tag.i nil, class: 'icon-user'
      end
    end
  end

  def notification_icon(notification)
    if notification.content.include? 'following'
      content_tag :div, nil, class: 'no_image d-flex justify-content-center align-items-center ml-3' do
        tag.i nil, class: 'icon-user-following'
      end
    else
      content_tag :div, nil, class: 'no_image d-flex justify-content-center align-items-center ml-3' do
        tag.i nil, class: 'icon-playlist'
      end
    end
  end

  def follow_button(follower, followed)
    if follower == followed
      nil
    elsif follower.following?(followed)
      button_to unfollow_path(follower_id: follower.id, followed_id: followed.id), method: :delete, title: 'Unfollow' do
        content_tag :i, nil, class: 'icon-close'
      end
    else
      button_to follow_path(follower_id: follower.id, followed_id: followed.id), method: :post, title: 'Follow' do
        content_tag :i, nil, class: 'icon-plus'
      end
    end
  end

  def display_users(users, none_msg)
    if users.any?
      list = ''
      users.each do |user|
        list += render 'shared/user_item', user: user
      end
      list.html_safe
    else
      content_tag :span, none_msg, class: 'no_data text-center'
    end
  end

  def display_opinions(opinions)
    if opinions.any?
      list = ''
      opinions.each do |opinion|
        list += render 'shared/opinion_item', data: opinion
      end
      list.html_safe
    else
      content_tag :span, 'NO OPINION', class: 'no_data text-center'
    end
  end

  def display_notifications(notifications)
    if notifications.any?
      list = ''
      notifications.each do |notification|
        list += render 'shared/notification_item', data: notification
      end
      list.html_safe
    else
      content_tag :span, 'NO NOTIFICATION YET!', class: 'no_data text-center'
    end
  end
end
