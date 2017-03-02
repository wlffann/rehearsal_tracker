require 'rails_helper'

describe 'Manager creates a note' do
  before do
    @user = create(:user)
    @company = create(:company)
    create(:company_manager, company: @company, user: @user)
    @production = create(:production, company: @company)
    create_list(:team, 2, production: @production)
    @rehearsal = create(:rehearsal, production: @production)
    stub_login_user(@user)
  end

  xit 'is added to the the rehearsal show' do
    visit company_production_rehearsal_path(@company.name, @production.title, @rehearsal.id)
    click_on "New Note"
    fill_in 'note_content', :with => 'Final dress on Wednesday'
    find('#note_team_id').find(:xpath, 'option[2]').select_option
    click_on 'Create Note'

    expect(current_path).to eq(company_production_rehearsal_path(@company.name, @production.title, @rehearsal.id))
    within('.notes') do
      expect(page).to have_content('Final dress on Wendesday')
      expect(page).to have_content('inactive')
    end
  end
end
