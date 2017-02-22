class Production < ApplicationRecord
  belongs_to :company
  has_many :rehearsals
  has_many :teams

  validates :title, presence: true
end
