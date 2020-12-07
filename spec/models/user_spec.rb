require_relative '../rails_helper'

RSpec.describe User, type: :model do
  it 'validates name, username and email' do
    user = User.new(name: '', username: '')
    user2 = User.new(name: 'eric', username: 'eric')
    expect(user.valid?).to be(false)
    expect(user2.valid?).to be(true)
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:posts) }
    it { should have_many(:follows_user) }
    it { should have_many(:followings).through(:follows_user) }
    it { should have_many(:follows_follow) }
    it { should have_many(:followers).through(:follows_follow) }
  end
end
