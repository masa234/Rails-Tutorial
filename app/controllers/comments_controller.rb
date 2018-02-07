class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :set_micropost, only: %w(new create)
  
  def new
    @comment = current_user.comments.build(micropost_id: @micropost.id)
  end
  
  def create
    @comment= @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      swal{success 'コメントを作成しました'}
      redirect_back(fallback_location: root_path)
    else
      swal{error '0～140文字でお願いいたします'}
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @comment= Comment.find(params[:id])
    if @comment && current_user?(@comment.user)
      @comment.destroy
      swal{success '削除しました'}
      redirect_back(fallback_location: root_path)
    else
      swal{error '削除権限がありません'}
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
    def set_micropost
      @micropost = Micropost.find(params[:micropost_id])
    end
  
    def comment_params
      params.require(:comment).permit(:message)
    end
end
