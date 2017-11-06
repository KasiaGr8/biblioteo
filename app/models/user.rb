class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :generate_sms_token

  def generate_sms_token
    token = rand(100000..999999)
    return generate_sms_token if User.find_by(confirmed: false, sms_token: token).present? # namiastka rekurencji
    self.sms_token = token
  end
  
  def send_sms_token!
    SmsApi::Connection.new(
      to: phone, 
      message: "Sms token to: #{sms_token}", 
      from: "Alert"
    ).deliver!
  end
  # validates :name, presence: true, length: { maximum: 50 }, on: :create
  # validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, on: :create
  # validates :password, presence: true, length: { minimum: 3 }, on: :create
end

