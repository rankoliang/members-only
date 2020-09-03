module SessionsHelper
  attr_writer :current_user

  def sign_in(user)
    user.remember
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id]
  end

  def sign_out
    current_user&.update_attribute(:remember_digest, nil)
    self.current_user = nil
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
