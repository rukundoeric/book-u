require_relative '../rails_helper'

RSpec.describe Follow, type: :model do
  it 'validates user_id and follow_id' do
    User.create(name: 'eric', username: 'eric')
    User.create(name: 'yves', username: 'yves')

    follow = Follow.new(user_id: '', follow_id: '')
    follow2 = Follow.new(user_id: 1, follow_id: 2)
    expect(follow.valid?).to be(false)
    expect(follow2.valid?).to be(true)
  end

  describe 'ActiveRecord associations' do
    it { should belong_to(:user) }
    it { should belong_to(:follow) }
  end
end
