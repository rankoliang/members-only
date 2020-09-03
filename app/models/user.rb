class User < ApplicationRecord
  has_many :posts
  attr_accessor :remember_token

  before_create :create_remember_token
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
    self.remember_digest = Digest::SHA1.hexdigest(remember_token)
  end

  def remember
    create_remember_token
    update_attributes(remember_digest: remember_digest)
  end
end
