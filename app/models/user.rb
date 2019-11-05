require 'securerandom'
class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates_presence_of :api_key
  has_secure_password

  def self.api_key_generator
    SecureRandom.hex
  end
end
