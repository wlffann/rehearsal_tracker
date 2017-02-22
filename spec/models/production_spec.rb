require 'rails_helper'

RSpec.describe Production, type: :model do
  describe 'relationships' do
    it { should belong_to(:company) }
    it { should have_many(:rehearsals) }
    it { should have_many(:teams) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
