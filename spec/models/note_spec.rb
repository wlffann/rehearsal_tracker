require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'relationships' do
    it { should belong_to(:rehearsal) }
    it { should belong_to(:team) }
  end

  describe 'validations' do
    it { should  validate_presence_of(:content) }
  end
end
