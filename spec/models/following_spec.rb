require 'rails_helper'

RSpec.describe Following, type: :model do
  it 'validates user_id and follow_id' do
    User.create(fullname: 'eric', username: 'eric')
    User.create(fullname: 'yves', username: 'yves')

    follow = Following.new(follower_id: nil, followed_id: nil)
    follow2 = Following.new(follower_id: 1, followed_id: 2)
    expect(follow.valid?).to be(false)
    expect(follow2.valid?).to be(true)
  end

  describe 'ActiveRecord associations' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end
end
