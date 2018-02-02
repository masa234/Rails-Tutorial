class RepliesController < ApplicationController
  before_action :require_sign_in
  before_action :set_micropost
  
  def new
    @reply = current_user.replies.build(user_name: current_user.name, micropost_id: @micropost.id)
  end
  
  def create
    @reply = @micropost.replies.build(reply_params)
    @reply.user_id = current_user.id
    @reply.save!
  end
  
  private
    def set_micropost
      @micropost = Micropost.find(params[:micropost_id])
    end
  
    def reply_params
      params.require(:reply).permit(:message, :user_name)
    end
end
