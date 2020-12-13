require 'rails_helper'

RSpec.describe Opinion, type: :model do
  it 'validates content of openion' do
    user = User.create(fullname: 'eric', username: 'eric')
    opinion = user.opinions.new(text: '')
    opinion2 = user.opinions.new(text: 'Hello there are yuo okay')
    expect(opinion.valid?).to be(false)
    expect(opinion2.valid?).to be(true)
  end

  describe 'ActiveRecord Association' do
    it { should belong_to(:author) }
  end
end
