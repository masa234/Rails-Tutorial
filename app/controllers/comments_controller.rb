class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :set_micropost, only: %i(new create)
  
  def new
    @comment = current_user.comments.build(user_name: current_user.name, micropost_id: @micropost.id)
  end
  
  def create
    @comment= @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save!
  end
  
  def destroy
    @comment= Comment.find(params[:id])
    if @comment && current_user?(@comment.user)
      @comment.destroy
      swal{success '削除しました'}
      redirect_back(fallback_location: root_path)
    else
      swal{success '削除権限がありません'}
      redirect_to "/"
    end
  end
  
  private
    def set_micropost
      @micropost = Micropost.find(params[:micropost_id])
    end
  
    def comment_params
      params.require(:comment).permit(:message, :user_name)
    end
end
