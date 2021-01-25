class User < ApplicationRecord
  before_save { email.downcase! }
  has_many :microposts
  validates :name, presence: true, length: { maximum:50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 6},
                      format: {with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6 }
  
  has_secure_password
end
