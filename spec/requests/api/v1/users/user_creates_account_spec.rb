require 'rails_helper'

describe "User api" do
  # you could clal it user ingo
  # let(:user_attribute) {{email: password: password_confirmation}}
  it "user can send post requet and receive api key" do
    allow(SecureRandom)
      .to receive(:hex)
      .and_return("862e67f49fcf4be0cd49570633e97771")

    post "/api/v1/users?email=email@example.com&password=password&password_confirmation=password"
    # post user, not user
    # params: user_attributes
    expect(response).to be_successful
    user_response = JSON.parse(response.body)
    binding.pry
    expect(user_response["api_key"]).to eq("862e67f49fcf4be0cd49570633e97771")
  end
end
