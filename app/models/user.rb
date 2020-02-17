class User < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_many :posts
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    before_save { self.email = email.downcase }
    has_secure_password
end