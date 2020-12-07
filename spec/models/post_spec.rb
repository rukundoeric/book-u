require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  it 'validates content of post' do
    user = User.create(name: 'eric', username: 'eric')
    post = user.posts.new(content: '')
    post2 = user.posts.new(content: 'Hello there are yuo okay')
    expect(post.valid?).to be(false)
    expect(post2.valid?).to be(true)
  end

  describe "ActiveRecord Association" do
    it { should belong_to(:user) } 
  end
end
