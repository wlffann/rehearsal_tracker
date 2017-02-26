require 'rails_helper'

describe 'Rehearsals' do
  before do
    @user = create(:user)
    @company = create(:company)
    create(:company_manager, user: @user, company: @company)
    @production = create(:production, company: @company)
    stub_login_user(@user)
  end

  it 'Managers can create a rehearsal' do
    visit company_production_path(@company.name, @production.title)
    click_on 'Create a new rehearsal'
    fill_in 'rehearsal_date', :with =>  'Monday, Feburary 27'
    fill_in 'rehearsal_location', :with => 'Colonel Theatre'
    fill_in 'rehearsal_description', :with => 'Rehearsed Act III'
    click_on 'Create Rehearsal'

    expect(current_path).to eq(company_production_rehearsal_path(@company.name, @production.title, @production.rehearsals.last))
    expect(page).to have_content("New rehearsal created!")
    expect(page).to have_content("Monday, Feburary 27")
    expect(page).to have_content('Colonel Theatre')
    expect(page).to have_content('Rehearsed Act III')
  end
end
