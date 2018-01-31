class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def require_sign_in
    return if sign_in?
    swal{error 'ログインしてくださいませ'}
    redirect_to "/"
  end
end



