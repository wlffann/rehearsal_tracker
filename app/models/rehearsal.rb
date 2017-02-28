class Rehearsal < ApplicationRecord
  has_many :notes
  belongs_to :production

  validates :location, presence: true
  validates :date, presence: true

  scope :where_manager, ->(user_id) { joins(production: :company_managers).where('company_managers.user_id = ?', user_id) }
end
