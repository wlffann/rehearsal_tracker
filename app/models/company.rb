class Company < ApplicationRecord
  has_many :productions
  has_many :company_managers
  
  validates :name, presence: true, uniqueness: true

  def managers
    User.joins(:managements).where('company_managers.company_id = ?', self.id)
  end
end
