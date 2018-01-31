class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def require_sign_in
    return if sign_in?
    store_location
    swal{error 'ログインしてくださいませ'}
    redirect_to login_url
  end
end



