class User < ActiveRecord::Base
  before_save { email.downcase! } # callback that downcases the email so that Example.CoM and example.com are the same
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 } 
  # for the two lines right above,
  # It turns out the has_secure_password method includes a presence validation, 
  # but it only applies to new records, which causes problems when updating users.
end