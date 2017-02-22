class Team < ApplicationRecord
  belongs_to :production
  has_many :memberships
  has_many :members, through: :memberships, foreign_key: 'user_id'
  has_many :notes

  validates :name, presence: true
end
