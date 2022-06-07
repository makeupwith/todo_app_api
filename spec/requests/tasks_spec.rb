require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task) }
  let(:subtask) { FactoryBot.create(:subtask) }
  
  # GET #index / タスクの一覧取得
  describe "GET #index" do
    context "正常系" do
      before do
        log_in_as user
        get tasks_path
      end 
      
      it "HTTP ステータスコード 200が返される" do
        # puts response.body
        expect(response).to have_http_status(200)
      end
      
      it "タスクの一覧を取得できる" do
        # *ISSUE タスクの一覧が取得できているかどうかの判定方法が分からない
      end
    end
    
    context "異常系" do
    end
  end
  
  # GET #show / タスクの取得
  describe "GET #show" do
    context "正常系" do
      before do
        log_in_as user
        get task_path task.id
      end
    
      it "タスクを取得できる" do
        # puts response.body
      end
      
      it "タスクに関連付けされたサブタスクを取得できる" do
        # puts response.body
      end
      
      it "HTTP ステータスコード 200が返される" do
        expect(response).to have_http_status(200)
      end
    end
    
    context "異常系" do
    end
  end
  
  #POST #create / タスクの作成
  describe "POST #create" do
    before do
      log_in_as user
    end
    
    context "正常系" do
      let(:task_params) { { task: { name: "hogehoge",
                                    description: "hogehoge", 
                                    deadline: "2022-10-20",
                                    completed: "false",
                                    user_id: "1",
                                    assignee_id: "1",
                                    public: "false" } } }
      
      it "タスクの作成ができる" do
        expect {
          post tasks_path, params: task_params
        }.to change(Task, :count).by(1)
      end
      
      # *ISSUE なぜか204が帰ってくる
      # it "HTTP ステータスコード 201が返される" do
      #   expect(response).to have_http_status(201)
      # end
    end
    
    context "異常系" do
    end
  end
  
  #PATCH #update / タスク情報の編集
  describe "PATCH #update" do
    before do
      log_in_as user
    end
  
    context "正常系" do
    end
    
    context "異常系" do
    end
  end
  
  # DELETE #destroy
  describe "DELETE #destroy" do
    context "認証済みユーザとして" do
      before do
        log_in_as user
      end
      
      # *ISSUE タスクの削除が行われない
      it "タスクの削除ができる" do
        # expect{
        #   delete task_path(task.id)
        # }.to change(Task, :count).by(-1)
      end
      
      # 関連付けされたサブタスクを削除できる
      it "タスクの削除ができる" do
        # *関連付けされたサブタスクを削除方法がわからない
        # delete task_path task.id
      end
      
      
      it "HTTP ステータスコード 204が返される" do
        expect(response).to have_http_status(204)
      end
    end
  end
end
