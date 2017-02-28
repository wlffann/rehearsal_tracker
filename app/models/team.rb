class Team < ApplicationRecord
  belongs_to :production
  has_many :memberships
  has_many :members, through: :memberships, foreign_key: 'user_id'
  has_many :notes

  validates :name, presence: true

  scope :where_manager, ->(user_id) { joins(production: :company_managers).where('company_managers.user_id = ?', user_id) }
end
