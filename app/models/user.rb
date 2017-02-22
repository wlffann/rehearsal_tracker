class User < ApplicationRecord
  has_many :memberships
  has_many :managements, class_name: 'CompanyManager'
  has_many :companies, through: :managements

  validates :name, presence: true
  validates :email, presence: true
end
