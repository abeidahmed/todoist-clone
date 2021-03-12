module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:auth_token] = { value: user.auth_token, expires: 7.days.from_now }
  end

  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end

  def user_signed_in?
    !!current_user
  end

  def sign_out_user
    cookies.delete(:auth_token) if user_signed_in?
  end
end
