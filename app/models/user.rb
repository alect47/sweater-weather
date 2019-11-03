# require 'securerandom'
class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: true

  def api_key_generator
    SecureRandom.hex
  end
end
