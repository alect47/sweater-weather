require 'rails_helper'

describe "User api" do

  it "user can send post requet and receive api key" do
    allow(SecureRandom)
      .to receive(:hex)
      .and_return("862e67f49fcf4be0cd49570633e97771")

    user_info = '{"email": "email@example.com", "password": "password", "password_confirmation": "password"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/users", params: user_info, headers: headers

    expect(response).to be_successful

    user_response = JSON.parse(response.body)
    expect(user_response["api_key"]).to eq("862e67f49fcf4be0cd49570633e97771")
  end

  it "user can send error messages" do
    allow(SecureRandom)
      .to receive(:hex)
      .and_return("862e67f49fcf4be0cd49570633e97771")

    user_info = '{"email": "", "password": "", "password_confirmation": ""}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/users", params: user_info, headers: headers

    user_response = JSON.parse(response.body)
    expect(user_response["errors"]).to eq("Invalid credentials: Password can't be blank and Email can't be blank")
  end
end




# you could call it user info
# let(:user_attribute) {{email: password: password_confirmation}}

# post user, not user
# params: user_attributes
