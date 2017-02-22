class Rehearsal < ApplicationRecord
  has_many :notes
  belongs_to :production

  validates :location, presence: true
  validates :date, presence: true
end
