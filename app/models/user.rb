class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :session_token, :password_digest, presence: true
  before_validation :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.reset_session_token!
  end

  def password=(password)

    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest) == password
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    if @user && @user.is_password?(password)
      @user
    else
      nil
    end
  end

end
