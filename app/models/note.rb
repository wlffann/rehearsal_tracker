class Note < ApplicationRecord
  belongs_to :rehearsal
  belongs_to :team

  validates :content, presence: true
  
  enum status: [:inactive, :active, :completed]

  scope :group_by_team, ->(team_id) { joins(:team).where('teams.id = ?', team_id) }
end
