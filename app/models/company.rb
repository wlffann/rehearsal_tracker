class Company < ApplicationRecord
  has_many :productions
  has_many :company_managers
  
  validates :name, presence: true, uniqueness: true

  scope :where_manager, ->(user_id) { joins(:company_managers).where('company_managers.user_id = ?', user_id) }
  scope :where_member, ->(user_id) { joins(productions: :memberships).where('memberships.user_id = ?', user_id) }

  def managers
    User.joins(:managements).where('company_managers.company_id = ?', self.id)
  end

end
