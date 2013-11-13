require 'spec_helper'

describe User do
  describe 'self.login' do
    let(:user) { user = User.create! email: 'a@b.com', salt: '$2a$10$CdM9sRxpSo6.NiPwTyJHn.' }

    before(:each) do
      UserHash.create! full_hash: 'E2ohCX4lPyl2L00jjCf9/j9/gkBt6tO'
    end

    it 'returns true with correct password' do
      User.login(user.email, 'welcome').should == true
    end

    it 'returns false with incorrect password' do
      User.login(user.email, 'wrong password').should == false
    end
  end
end
