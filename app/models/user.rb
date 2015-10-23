class User < ActiveRecord::Base
  attr_accessor :password
  has_many :posts
  validates_confirmation_of :password
  validates :email, uniqueness: true
  before_save :encrypt_password
  # Enact when user model is updated
  # before_save :make_admin

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  private
  # def make_admin
  #   if User.all.length < 1
  #     self.admin = true
  #   end
  # end
end
