class LikeController < ApplicationController
  before_action :require_sign_in
  before_action :set_micropost
  
  def create
    Like.create!(user_id: current_user.id, micropost_id: @micropost.id) unless @micropost.like_user?(current_user)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy 
    like =Like.find_by(user_id: current_user.id, micropost_id: @micropost.id).destroy if @micropost.like_user?(current_user)
    redirect_back(fallback_location: root_path)
  end
    
    
  private
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end
end

