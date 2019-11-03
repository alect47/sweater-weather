require 'rails_helper'

describe User do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
  end

  describe 'instance_methods' do
    it 'api_key_generator' do
      user = User.create(email: 'email@email.com')
      expect(user.api_key_generator).to be_a String
    end
  end
end
