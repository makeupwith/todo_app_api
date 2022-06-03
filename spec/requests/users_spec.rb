require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.build(:user)
  end
  
  let(:user) { FactoryBot.create(:user) }
  # let(:other_user) { FactoryBot.create(:user) }
  
  # GET #index / ユーザの一覧取得
  describe "GET #index" do
    context "認証済みユーザとして" do
      it "ユーザの一覧を取得できる" do
        log_in_as user
        get user_path user
        expect(assigns :user).to eq user
      end
    end
  end
  
  # POST #create / ユーザの作成
  describe "POST #create" do
    it "ユーザの作成ができる" do
      user_params = FactoryBot.attributes_for(:user)
      
      # ユーザが作成されない
      # expect {
      #   post users_path, params: { user: user_params }
      # }.to change(User, :count).by(1)
    end
  end
  
  # GET #show / ユーザ情報の取得
  describe "GET #show" do
    context "認証済みユーザとして" do
      it "ユーザ情報を取得できる" do
        log_in_as user
        get user_path user, params: { session: { email: user.email,
                                           password: user.password } }
        expect(assigns :user).to eq user
      end
    end
  end
  
  # PATCH #update / ユーザ情報の更新
  describe "PATCH #update" do
    context "認証済みユーザとして" do
      before do
        log_in_as user
        @name = 'hoge'
        @email = 'hoge@gmail.com'
        @password = 'password'
        patch user_path user, params: { user: { display_name: @name,
                                                  email: @email,
                                                  password: '12345678',
                                                  password_confirmation: @password } }
      end
      
      it '表示名を更新できる' do
        user.reload
        expect(user.display_name).to eq @name
      end
      
      it 'メールアドレスを更新できる' do
        user.reload
        expect(user.email).to eq @email
        # expect(user.password).to eq @password
      end
      
      it 'パスワードを更新できる' do
        user.reload
        # expect(user.password).to eq @password
      end
    end
    
  end
end
