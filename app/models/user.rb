class User < ApplicationRecord
  has_secure_password

  before_validation :strip_email_address
  before_save :lowercase_email_address
  before_create :generate_auth_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :full_name, presence: true, length: { maximum: 255 }
  validates :email_address, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } # rubocop:disable Layout/LineLength
  validates :password, presence: true, length: { minimum: 6 }

  private

  def strip_email_address
    self.email_address = email_address.to_s.strip
  end

  def lowercase_email_address
    self.email_address = email_address.to_s.downcase
  end

  def generate_auth_token
    generate_token(:auth_token)
  end

  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end
end
