class User < ActiveRecord::Base
  has_secure_password
  # use Michael Hartl's regex for email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true,
            format: /\A\S+@\S+\z/
  validates :email, presence: true,
            format: VALID_EMAIL_REGEX,
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 7, allow_blank: true }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

end
