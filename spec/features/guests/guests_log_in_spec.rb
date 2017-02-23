require 'rails_helper'

describe 'Guest logs in' do
  it 'with GoogleOAuth' do
    stub_omniauth
    visit root_path
    click_on "Get Started"
    click_on "Login with Google"

    expect(current_path).to eq(user_path(User.first))
  end
end

