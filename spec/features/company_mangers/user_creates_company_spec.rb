require 'rails_helper'

describe 'User creates company' do
  before do 
    @user = create(:user)
    stub_login_user(@user)
  end

  it 'they can make themselves a manager' do
    visit user_path(@user)
    click_on 'Create a new company'
    fill_in 'company_name', :with => "New Company"
    fill_in 'company_location', :with => "New York City"
    fill_in 'company_logo_url', :with => Faker::Placeholdit.image
    click_on "Create Company"

    expect(current_path).to eq(company_path(Company.last.name))
    expect(page).to have_content("Your company has been created!")
    expect(page).to have_content("New Company")
    expect(page).to have_content("New York City")
    expect(Company.last.managers.first).to eq(@user)
  end
end
