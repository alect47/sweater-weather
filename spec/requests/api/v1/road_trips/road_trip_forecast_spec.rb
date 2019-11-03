require 'rails_helper'

describe 'Road trip api' do
  it 'user can get forecast for road trip' do
    user = User.create!(email: 'alec@gmail.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    user_info = '{"origin": "Denver,CO", "destination": "Pueblo, CO", "api_key": "jgn983hy48thw9begh98h4539h4"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/road_trip", params: user_info, headers: headers

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_naems: true)

    # Conver time to unix (Time.now.to_i) add duration[:value] and then add the two and do
    # then the sume is the input for the service
    expect(results).to be_a Hash
    expect(results[:data][:attributes][:distance]).to eg("223 mi")
    expect(results[:data][:attributes][:travel_time]).to eg("223 mi")
    expect(results[:data][:attributes][:forecast]).to be_a Hash
    expect(results[:data][:attributes][:forecast][:temperature]).to eq("70")
    expect(results[:data][:attributes][:forecast][:summary]).to eq("Partly Cloudy")
  end
end
