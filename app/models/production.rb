class Production < ApplicationRecord
  belongs_to :company
  has_many :rehearsals
  has_many :teams
  has_many :memberships, through: :teams
  has_many :company_managers, through: :company
  has_many :notes, through: :rehearsals

  validates :title, presence: true

  scope :where_manager, ->(user_id) { joins(company: :company_managers).where('company_managers.user_id = ?', user_id) }
  scope :where_member, ->(user_id) { joins(teams: :memberships).where('memberships.user_id = ?', user_id) } 
  
  def members
    User.joins(memberships: :team).where('teams.production_id=?', self.id)
  end

end
