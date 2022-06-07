class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    # if logged_in?
      @tasks = Task.all.includes(:subtasks)
      puts @tasks
      render json: @tasks
    # else
    #   puts "not_logged_in"
    #   render json: { errors: { title: 'ログインがされていません', detail: 'IDに該当するユーザは只今ログインされていません' } }, status: :unauthorized
    # end
  end

  # GET /tasks/1
  def show
    # if logged_in?
      if Task.where(id: params[:id]) == nil
      else
        @task = Task.find(params[:id])
        render json: @task, include: [:subtasks], stataus: :ok
      end
    # else
    #   puts "not_logged_in"
    #   render json: { errors: { title: 'ログインがされていません', detail: 'IDに該当するユーザは只今ログインされていません' } }, status: :unauthorized
    # end
  end

  # POST /tasks
  def create
    # if logged_in?
      @task = Task.new(task_params)
  
      if @task.save
        # puts "post/sucess" # デバッグ
        render json: {message: "sucess message"}, status: :created, location: @task
      else
        # puts "post/fail" # デバッグ
        render json: @task.errors, status: :bad_request
      end
    # else
    #   puts "not_logged_in"
    #   render json: { errors: { title: 'ログインがされていません', detail: 'IDに該当するユーザは只今ログインされていません' } }, status: :unauthorized
    # end
  end

  # PATCH/PUT /tasks/1
  def update
    # if logged_in?
      if @task.update(task_params)
        render json: { message: "sucess message" }
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    # else
    #   puts "not_logged_in"
    #   render json: { errors: { title: 'ログインがされていません', detail: 'IDに該当するユーザは只今ログインされていません' } }, status: :unauthorized
    # end
  end

  # DELETE /tasks/1
  def destroy
    # if logged_in?
      if Task.where(id: params[:id]) == nil
        render json: {message: "ID:#{task_id}のタスクが存在しません"}
      else
        @task = Task.find(params[:id])
        @task.destroy
        render json: { message: "success message" }, status: :no_content
      end
    # else
    #   render json: { errors: { title: 'ログインがされていません', detail: 'IDに該当するユーザは只今ログインされていません' } }, status: :unauthorized 
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :deadline, :completed, :user_id, :assignee_id, :public)
    end
end
