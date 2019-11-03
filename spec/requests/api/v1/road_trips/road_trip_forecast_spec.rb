require 'rails_helper'

describe 'Road trip api' do
  it 'user can get forecast for road trip' do
    user = User.create!(email: 'alec@gmail.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')

    user_info = '{"origin": "Denver,CO", "destination": "Pueblo, CO", "api_key": "jgn983hy48thw9begh98h4539h4"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/road_trip", params: user_info, headers: headers

    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to be_a Hash

    expect(results[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")

    expect(results[:data][:attributes][:temperature]).to be_a Float
    expect(results[:data][:attributes][:summary]).to be_a String
  end
  
  it 'user has invalid api key' do
    user = User.create!(email: 'alec@gmail.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')

    user_info = '{"origin": "Denver,CO", "destination": "Pueblo, CO", "api_key": "jgn123hy48thw9begh98h4539h4"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/road_trip", params: user_info, headers: headers

    expect(response.status).to eq(401)
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:errors]).to eq('Invalid or missing Api Key')
  end

  it 'user has missing api key' do
    user = User.create!(email: 'alec@gmail.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')

    user_info = '{"origin": "Denver,CO", "destination": "Pueblo, CO"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    post "/api/v1/road_trip", params: user_info, headers: headers

    expect(response.status).to eq(401)
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:errors]).to eq('Invalid or missing Api Key')
  end
end
