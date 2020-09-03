module SessionsHelper
  attr_writer :current_user

  def sign_in(user)
    user.remember
    session[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||=
      if session[:user_id]
        User.find(session[:user_id])
      elsif cookies[:remember_token]
        User.find_by(
          remember_digest: Digest::SHA1.hexdigest(cookies[:remember_token])
        )
      end
  end

  def sign_out
    current_user&.update_attribute(:remember_digest, nil)
    self.current_user = nil

    reset_session
    cookies.delete(:remember_token)
  end

  def authenticate
    redirect_to login_path unless current_user
  end
end
