module SessionsHelper
  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def sign_in?
    !!current_user
  end
  
  def require_sign_in
    return if sign_in?
    swal {error  'ログインしてくださいませ'}
    redirect_to "/"
  end
end
 
 
