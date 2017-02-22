require 'rails_helper'

RSpec.describe CompanyManager, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:company) }
  end
end
