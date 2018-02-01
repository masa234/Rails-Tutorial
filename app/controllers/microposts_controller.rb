class MicropostsController < ApplicationController
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to "/"
    else
      swal { error '140文字以内でお願いいたします' }
      redirect_to "/"
    end
  end
  
  def destroy
  end
    
  private 
  
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
