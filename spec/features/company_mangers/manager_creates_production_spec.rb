require 'rails_helper'

describe 'Productions' do
  before do 
    @user = create(:user)
    @company = create(:company)
  end

  it 'they can create a new production' do
    create(:company_manager, company: @company, user: @user)
    stub_login_user(@user)
    visit company_path(@company.name)
    click_on "Create a new production"
    fill_in "production_title", :with => "The Music Man"
    fill_in "production_season", :with => "Spring 2017"
    fill_in "production_logo_url", :with => "http://www.weathervaneplayhouse.com/Data/Sites/1/assets/show-images/musicman_color.jpg"
    click_on "Create Production"

    expect(current_path).to eq(company_production_path(@company.name, @company.productions.last.title))
    expect(page).to have_content("Your production was created!")
    expect(page).to have_content("The Music Man")
    expect(page).to have_content("Spring 2017")
    expect(page).to have_content(@company.name)
    expect(page).to have_css("img[src*='http://www.weathervaneplayhouse.com/Data/Sites/1/assets/show-images/musicman_color.jpg']")
  end

  it 'cannot be created by a non-manager' do
    production = create(:production, company: @company)
    team = create(:team, production: production)
    create(:membership, user: @user, team: team)
    stub_login_user(@user)
    visit company_path(@company.name)
    
    expect(page).to_not have_content("Create a new production")
  end
end
