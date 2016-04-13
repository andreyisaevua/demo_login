class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: 'Enter e-mail'},
                    format: {with: VALID_EMAIL_REGEX, message: 'Please provide valid e-mail address'},
                    uniqueness: {case_sensitive: false, message: 'This e-mail is already taken'}

  has_secure_password validations: false
  validates :password, presence: {message: 'Enter password'},
                       length: {
                           in: 6..72,
                           too_short: 'Password must have at least %{count} characters',
                           too_long: 'Password must have at most %{count} characters'
                       },
                       confirmation: {message: 'Passwords do not match', allow_blank: true}

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
