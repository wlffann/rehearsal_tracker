require 'rails_helper'

describe 'Guest User' do
  context 'without email invitiation' do
    it 'creates an account' do
      visit root_path
      click_on "Get Started"
      fill_in "user[name]", :with => Faker::Name.name
      fill_in "user[email]", :with => Faker::Internet.email
      fill_in "user[password]", :with => "boom"
      fill_in "user[password_confirmation]", :with => "boom"
      click_on "Create Account"

      expect(current_path).to eq(user_path(User.first))
      expect(page).to have_content("Welcome! Your account was created.")
    end
  end
end
