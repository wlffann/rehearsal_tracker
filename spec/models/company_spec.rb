require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'relationships' do
    it { should have_many(:productions) }
    it { should have_many(:company_managers) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
