require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  # GET #index / ユーザの一覧取得
  describe "GET #index" do
    context "認証済みユーザとして" do
      before do
        log_in_as user
        get users_path
      end
      
      it "HTTP ステータスコード 200が返される" do
        expect(response).to have_http_status(200)
      end
      
      it "ユーザの一覧を取得できる" do
        # *ISSUE ユーザの一覧が取得できているかどうかの判定方法が分からない
      end
    end
  end
  
  # POST #create / ユーザの作成
  describe "POST #create" do
    context "正常な値が送られた場合" do
      let(:user_params) { { user: { display_name: "Toby Lowe", 
                                    email: "maryelleeen@gmail.com",
                                    password: "12345678", 
                                    password_confirmation: "12345678" } } }
      it "ユーザが作成される" do
        expect {
          post users_path, params: user_params
        }.to change(User, :count).by 1
      end
      
      it "HTTP ステータスコード 201が返される" do
        post users_path, params: user_params
        expect(response).to have_http_status(201)
      end
    end 
    
    context "異常な値が送られた場合 " do
      context "パラメータが空の場合" do
        let(:user_params) { { user: { display_name: "", 
                                      email: "",
                                      password: "", 
                                      password_confirmation: "" } } }
        
        it "ユーザが作成されない" do
          expect {
            post users_path, params: user_params
          }.not_to change(User, :count).from(0)
        end
      end
    end 
  end
  
  # PATCH #update / ユーザ情報の更新
  describe "PATCH #update" do
    context "認証済みユーザとして" do
      before do
        log_in_as user
        @name = "Toby Rowe"
        @email = "maryellllen@gmail.com"
        @password = "1234567890"
      end
      
      it "HTTP ステータスコード 204が返される" do
        expect(response).to have_http_status(204)
      end
      
      it '表示名を変更できる' do
        patch user_path user, params: { user: { display_name: @name } }
        expect(User.find(user.id).display_name).to eq(@name)
      end
      
      it 'メールアドレスを変更できる' do
        patch user_path user, params: { user: { email: @email } }
        expect(User.find(user.id).email).to eq(@email)
      end
      
      it 'パスワードを変更できる' do
        patch user_path user, params: { user: { password: @password, 
                                                password_confirmation: @password } }
        # puts response.body # デバッグ
        # *ISSUE ハッシュ化されたパスワードが変更されているかどうかの確認
        # expect(User.find(user.id).password_digest).to eq(@password)
      end
    end
  end
end