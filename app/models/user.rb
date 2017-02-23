class User < ApplicationRecord
  has_secure_password
  
  has_many :memberships
  has_many :managements, class_name: 'CompanyManager'
  has_many :companies, through: :managements

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
