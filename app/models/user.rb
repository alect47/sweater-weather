require 'securerandom'
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  # validates_presence_of :api_key
  has_secure_password

  def api_key_generator
    SecureRandom.hex
  end
end
