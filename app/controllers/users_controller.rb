class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update check_user)
  before_action :require_sign_in, except: %i(new create)
  before_action :check_user, only: %i(edit update)
  
  def new 
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to @user
    else
      swal { error 'ユーザ情報の登録に失敗いたしました 必須事項をご入力くださいませ' }
      render :new
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      redirect_to @user  
    else
      swal { error 'ユーザ情報の編集に失敗いたしました 必須事項をご入力くださいませ' }
      render :edit
    end
  end

  def index
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def check_user
    return if current_user?(@user)
    swal { error '申し訳ございません ページ閲覧権限がございません' }
    redirect_to "/"
  end
end





