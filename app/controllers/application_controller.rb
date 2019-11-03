class ApplicationController < ActionController::API
  def json_parse(json)
    JSON.parse(json.body.read, symbolize_names: true, quirks_mode: true)
  end
end
