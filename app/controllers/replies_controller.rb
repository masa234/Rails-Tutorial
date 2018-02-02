class RepliesController < ApplicationController
  def new
    @micropost = Micropost.find(params[:micropost_id])
    # @reply = Micropost.f
    # @reply = current_user.microposts.build(reply_name)
    # @reply = current_user.microposts.build(reply_nickname: @micropost.user.nickname, reply_micropost: @micropost.id)
  end
  
  def create
  end
end
