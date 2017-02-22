class Note < ApplicationRecord
  belongs_to :rehearsal
  belongs_to :team

  validates :content, presence: true
  
  enum status: [:inactive, :active, :completed]
end
