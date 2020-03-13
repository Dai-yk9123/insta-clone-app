class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user, only: [:edit, :update, :password_edit, :password_update]

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to my aplication!"
      redirect_to @user #デフォルトでGETリクエストをuser_pathに送る => show
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin? && !current_user?(@user)
      @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_path
    elsif current_user?(@user)
      @user.destroy
      flash[:success] = "Thank you. Please come again."
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def password_edit
    @user = User.find(params[:id])
  end

  def password_update
    @user = User.find(params[:id])
    if @user.authenticated?(:password, params[:user][:current_token])
      if params[:user][:password].empty?
        @user.errors.add(:password, :blank)
        render 'password_edit'
      elsif @user.update_attributes(user_params)
        flash[:success] = "Password updated!"
        redirect_to @user
      else
        render 'password_edit'
      end
    else
      flash.now[:danger] = "Not match current password!"
      render 'password_edit'
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end

  def facebook_login
    @user = User.from_omniauth(request.env["omniauth.auth"])
    result = @user.save(context: :facebook_login)
    if result
      log_in @user
      redirect_to @user
    else
      redirect_to auth_failure_path
    end
  end

  #認証に失敗した際の処理
  def auth_failure
    @user = User.new
    render 'new'
  end

  private

    # ユーザーパラメータの必要な情報だけ取得するメソッド
    def user_params
      params.require(:user).permit(:name, :user_name, :email, :password,
                                          :password_confirmation,
                                          :image,
                                          :url,
                                          :description)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
