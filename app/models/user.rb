class User < ActiveRecord::Base

  has_secure_password
  has_many :users
  validates :email, presence: true
  # validates :password, presence: true - we can take this out since we have password_digest
  validates :name, presence: true
end
