class Authentication
  def initialize(params)
    @email_address = params[:email_address]
    @password = params[:password]
  end

  def authenticated?
    !!user
  end

  def user
    @user ||= User.find_by(email_address: email_address)
    return unless @user

    @user.authenticate(password) ? @user : nil
  end

  private

  attr_reader :password

  def email_address
    @email_address.to_s.downcase
  end
end
