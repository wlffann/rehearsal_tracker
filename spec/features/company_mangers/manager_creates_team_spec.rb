require 'rails_helper'

describe 'Teams' do
  before do
    @user = create(:user)
    @company = create(:company)
    @production = create(:production, company: @company)
    create(:company_manager, company: @company, user: @user)
  end

  it 'managers can create teams' do
    visit company_production_path(@company.name, @production.title)
    click_on 'Create a new team'
    fill_in 'team_name', :with => 'Costume Department'
    click_on 'Create Team' 

    expect(current_path).to eq(company_production_path(@company.name, @production.title))
    expect(page).to have_content('Your team was created!')
    expect(page).to have_content('Costume Department')
  end
end
