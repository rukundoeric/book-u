require_relative '../rails_helper'

RSpec.describe User, type: :model do
  it 'validates fullname and username' do
    user = User.new(fullname: '', username: '')
    user2 = User.new(fullname: 'eric', username: 'eric')
    expect(user.valid?).to be(false)
    expect(user2.valid?).to be(true)
  end

  describe 'ActiveRecord associations' do
    it { should have_many(:opinions) }
    it { should have_many(:notifications) }
    it { should have_many(:follower_recs) }
    it { should have_many(:followings).through(:follower_recs) }
    it { should have_many(:followed_recs) }
    it { should have_many(:followers).through(:followed_recs) }
  end
end
