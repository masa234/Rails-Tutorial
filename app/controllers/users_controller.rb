class UsersController < ApplicationController
  before_action :set_user
  
  def show
  end

  def edit
  end

  def index
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
end


