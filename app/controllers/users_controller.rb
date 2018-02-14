class UsersController < ApplicationController
  before_action :set_user, only: %w(show edit update destroy followers following likes check_user)
  before_action :require_sign_in, except: %w(new create following followers)
  before_action :check_user, only: %w(edit update)
  
  def new 
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to @user
    else
      swal { error 'ユーザ情報の登録に失敗いたしました' }
      render :new
    end
  end
  
  def show
    @microposts = @user.microposts.page(params[:page])
  end

  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      redirect_to @user  
    else
      swal { error 'ユーザ情報の編集に失敗いたしました' }
      render :edit
    end
  end

  def index
    @users = User.order("created_at DESC").page(params[:page])
  end
  
  def destroy
    return unless current_user.admin? 
    @user.destroy
    swal { success '削除が完了しました' }
    redirect_back(fallback_location: root_path)
  end
  
  def following
    @title = "Following"
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end
  
  def likes
    @title = "Likes"
    @like_micropost = @user.like_microposts.page(params[:page])
    render 'like'
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :nickname ,:password, :password_confirmation)
  end
  
  def check_user
    return if current_user?(@user) 
    swal { error '申し訳ございません ページ閲覧権限がございません' }
    redirect_to "/"
  end
end





