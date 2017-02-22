require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should belong_to(:production) }
    it { should have_many(:notes) }
    it { should have_many(:memberships) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
