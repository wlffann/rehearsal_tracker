require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:team) }
  end

  describe 'validations' do
    it { should validate_presence_of(:role) }
  end
end
