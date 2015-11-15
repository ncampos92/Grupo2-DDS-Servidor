class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :proposals

  before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :user_token, absence: true, on: :create
  validates :nivel_acceso, presence: true

  #def authenticated?(remember_token)
  #  return false if remember_digest.nil?
  #  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  #end

	# Returns the hash digest of the given string.
  	def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

    def User.new_token
      begin
        @user_token = SecureRandom.urlsafe_base64
      end while self.exists?(user_token: @user_token)
      @user_token
    end
end
