class LikesController < ApplicationController
  before_action :require_sign_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    Like.create!(user_id: current_user.id, micropost_id: @micropost.id) unless @micropost.like_user?(current_user)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
  
  def destroy 
    @micropost = Like.find(params[:id]).micropost
    Like.find_by(user_id: current_user.id, micropost_id: @micropost.id).destroy if @micropost.like_user?(current_user)
    @users = @micropost.like_users
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end

