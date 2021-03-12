module Requests
  module SessionsHelper
    def sign_in(user = nil)
      user ||= create(:user)
      cookies[:auth_token] = user.auth_token
    end

    def signed_cookie
      ActionDispatch::Cookies::CookieJar.build(request, cookies.to_hash).signed
    end
  end
end
