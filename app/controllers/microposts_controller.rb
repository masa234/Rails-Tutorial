class MicropostsController < ApplicationController
  before_action :check_user, only: %i(edit update destroy)
  
  def edit
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to "/"
    else
      swal { error '140文字以内でお願いいたします' }
      @feed_items = []
      redirect_to "/"
    end
  end
  
  def destroy
    @micropost.destroy
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
