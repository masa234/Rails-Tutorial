class UsersController < ApplicationController
  before_action :set_user, except: %i(new)
  
  def new 
    @user = User.new
  end
  
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



