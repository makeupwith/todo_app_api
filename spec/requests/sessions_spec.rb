require 'rails_helper'
 
RSpec.describe "Sessions", type: :request do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "POST /login" do
    it "ログインできる" do
      user = FactoryBot.create(:user)
      post login_path, params: { session: { email: user.email,
                                           password: user.password } }
      expect(logged_in?).to be_truthy
    end
    
    it "正しいIDが返却されているか" do
      user = FactoryBot.create(:user)
      post login_path, params: { session: { email: user.email,
                                           password: user.password } }
      expect(session[:user_id]).to eq(@user.id)
    end
  end
  
  describe 'DELETE /logout' do
    it 'ログアウトできる' do
      user = FactoryBot.create(:user)
      post login_path, params: { session: { email: user.email,
                                          password: user.password } }
    
      delete logout_path
      expect(logged_in?).to_not be_truthy
    end
  end
end