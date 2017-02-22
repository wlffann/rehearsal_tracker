class Company < ApplicationRecord
  has_many :productions
  has_many :company_managers
  
  validates :name, presence: true, uniqueness: true
end
