require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.build(:user)
  end
  
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  
  # ユーザの作成
  describe "POST #create" do
    # it "タスクの作成ができる" do
    #   user_params = FactoryBot.attributes_for(:task)
    #   log_in_as user
      
    #   expect {
    #     post :create, params: { user: user_params }
    #   }.to change(@user, :count).by(1)
    # end
    before do
      @email = 'hoge_tarou@gmail.com'
      @password = 'hogehoge'
    end 
    it "ユーザの作成ができる" do
      post users_path, params: { user: { email: @email,
                                                password: @password } }
      # expect(@user.email).to eq @email
      # expect(@user.password).to eq @password
    end
  end
  
  # ユーザの一覧取得
  describe "GET #index" do
    context "認証済みユーザとして" do
      it "ユーザの一覧を取得できる" do
        log_in_as user
        get user_path user
        expect(response).to have_http_status "200"
        expect(assigns :user).to eq user
      end
    end
  end
  
  # ユーザ情報の取得
  describe "GET #show" do
    context "認証済みユーザとして" do
      it "ユーザ情報を取得できる" do
        log_in_as user
        get user_path user, params: { session: { email: user.email,
                                           password: user.password } }
        expect(response).to have_http_status "200"
        expect(user.id).to eq(@user.id)
      end
    end
  end
  
  # ユーザ情報の更新
  describe "PATCH #update" do
    context "認証済みユーザとして" do
      before do
        log_in_as user
        @name = 'hoge'
        @email = 'hoge@gmail.com'
        @password = 'password'
        patch user_path(user), params: { user: { display_name: @name,
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
