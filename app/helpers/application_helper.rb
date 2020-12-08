module ApplicationHelper
  def active(active_view)
    if controller == active_view
      'active'
    else
      ''
    end
  end
end
