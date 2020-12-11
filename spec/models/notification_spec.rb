require 'rails_helper'

RSpec.describe Notification, type: :model do
  it 'validates content of openion' do
    user = User.create(fullname: 'eric', username: 'eric')
    notification = user.notifications.new(title: nil, content: nil)
    notification2 = user.notifications.new(title: 'Follow', content: ' eric is following you!')
    expect(notification.valid?).to be(false)
    expect(notification2.valid?).to be(true)
  end

  describe 'ActiveRecord Association' do
    it { should belong_to(:user) }
  end
end
