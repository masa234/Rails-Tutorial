class MicropostsController < ApplicationController
  before_action :require_sign_in
  before_action :check_user, only: %w(edit update destroy)
  
  def edit
  end
  
  def update
    @user = @micropost.user
    @micropost.update(micropost_params)
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to "/"
    else
      swal { error '140文字以内でお願いいたします' }
      @feed_items = current_user.feed(current_user)
      render 'toppages/root'
    end
  end
    
  
  def destroy
    @micropost.destroy
    swal { success '削除しました'}
    redirect_back(fallback_location: root_path)
  end
    
  private 
  
    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
    def check_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      return if @micropost
      redirect_to "/"
      swal{ error '削除権限がございません'} 
    end
end
