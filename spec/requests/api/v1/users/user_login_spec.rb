require 'rails_helper'

describe "User api" do

  it "user can send post request to sessions and login" do
    user = User.create!(email: 'alec@gmail.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
    user_info = '{"email": "alec@gmail.com", "password": "password"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/sessions", params: user_info, headers: headers

    expect(response).to be_successful

    user_response = JSON.parse(response.body)
    expect(user_response["api_key"]).to eq("jgn983hy48thw9begh98h4539h4")
  end

  it "user give error if invalid" do
    user = User.create!(email: 'alec@gmail.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
    user_info = '{"email": "alecs@gmail.com", "password": "passsword"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/sessions", params: user_info, headers: headers

    user_response = JSON.parse(response.body)
    expect(user_response["errors"]).to eq("Invalid username or password")
  end
# 493401b34500783883cbedbb5952bc94
end
