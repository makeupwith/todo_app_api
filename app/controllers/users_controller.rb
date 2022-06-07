class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      # puts "post/sucess" # デバッグ
      render json: @user, status: :created, location: @user
    else
      # puts "post/fail" # デバッグ
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    # ログインしてるかどうか：app/helpers/sessions_helper.rb
    # if logged_in?
      # 該当のユーザを探す
      @user = User.find(params[:id])
      # 該当のユーザ情報を更新する
      if @user.update(user_params)
        # puts "patch/sucess" # デバッグ
        render json: @user, status: :created
      else
        # puts "patch/fail" # デバッグ
        render json: @user.errors, status: :unprocessable_entity
      end
    # else
    #   puts "not_logged_in" # デバッグ用
    # render json: { errors: { title: 'ログインがされていません', detail: 'IDに該当するユーザは只今ログインされていません' } }, status: :unauthorized 
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :display_name)
    end
end
