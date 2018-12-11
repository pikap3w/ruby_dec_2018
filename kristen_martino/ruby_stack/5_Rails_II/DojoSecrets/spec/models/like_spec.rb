require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'relationships' do
    before do
      @user   = create(:user)
      @secret = create(:secret, user: @user)
      @like   = create(:like, secret: @secret, user: @user)
    end
    it 'belongs to a user' do
      expect(@like.user).to eq(@user)
    end
    it 'belongs to a secret' do
      expect(@like.secret).to eq(@secret)
    end
  end
end
https://github.com/pikap3w/ruby_dec_2018/tree/dec10/kristen_martino/ruby_stack/5_Rails_II/DojoSecrets 