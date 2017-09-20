class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # validates :name, presence: true, length: { maximum: 50 }, on: :create
  # validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, on: :create
  # validates :password, presence: true, length: { minimum: 3 }, on: :create
end

