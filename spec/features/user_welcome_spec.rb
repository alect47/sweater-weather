require 'rails_helper'

describe "user can visit the welcome page" do
  xscenario "and see text" do
    visit '/'
    expect(page).to have_content("Hi")
  end
end
