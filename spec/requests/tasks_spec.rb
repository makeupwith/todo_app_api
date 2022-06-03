require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.build(:task)
  end
  
  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task) }
  
  # GET #index / タスクの一覧取得
  describe "GET #index" do
    context "認証済みユーザとして" do
      it "タスクの一覧を取得できる" do
        log_in_as user
        get task_path task
        expect(response).to have_http_status "200"
        expect(assigns :task).to eq task
      end
    end
  end
  
  #POST #create / タスクの作成
  describe "POST #create" do
    # it "タスクの作成ができる" do
    #   task_params = FactoryBot.attributes_for(:task)
    #   log_in_as user
      
    #   #ISSUE：count
    #   expect {
    #     post :create, params: { task: task_params }
    #   }.to change(User, :count).by(1)
    # end
    # context "認証済みユーザとして" do
    #   before do
    #     @deadline = '2022-06-03'
    #     @description = 'リビングからロフトまでの拭き掃除'
    #     @name = '大掃除'
    #     @assignee_id = 1
    #     log_in_as user
    #     post tasks_path params: { task: { completed: false, 
    #                                       deadline: @deadline, 
    #                                       description: @description,
    #                                       name: @name,
    #                                       public: "true",
    #                                       assignee_id: @assignee_id }}
    #   end
    #   it "期日の追加ができる" do
    #     expect(assigns :task).to eq(task)
    #   end
    #   it "詳細の追加ができる" do
    #     expect(task.description).to eq(@description)
    #   end
    #   it "タスク名の追加ができる" do
    #     expect(task.name).to eq(@name)
    #   end
    #   it "担当者IDの追加ができる" do
    #     expect(task.user_id).to eq(@assignee_id)
    #   end
    #   it "作成ユーザIDの追加ができる" do
    #     expect(task.user_id).to eq(1)
    #   end
    # end
  end
  
  #PATCH #update / タスク情報の編集
  describe "PATCH #update" do
    
  end
end
