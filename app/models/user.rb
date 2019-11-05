require 'securerandom'
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  # validates_presence_of :api_key

  def api_key_generator
    SecureRandom.hex
  end
end
