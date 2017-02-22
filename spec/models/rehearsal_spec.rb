require 'rails_helper'

RSpec.describe Rehearsal, type: :model do
  describe 'relationships' do
    it { should belong_to(:production) }
    it { should have_many(:notes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:location) }
  end
end
