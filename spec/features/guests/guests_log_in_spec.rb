require 'rails_helper'

describe 'Guest logs in' do
  it 'with GoogleOAuth' do
    stub_omniauth
    visit root_path
    click_on "Get Started"

    expect(current_path).to eq(user_path(User.first))
    expect(page).to have_content("Severus Snape")
    expect(page).to have_content("Your account was created!")
  end
end

