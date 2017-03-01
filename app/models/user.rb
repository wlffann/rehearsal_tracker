class User < ApplicationRecord
  has_many :memberships
  has_many :managements, class_name: 'CompanyManager'
  has_many :companies, through: :managements
  has_many :productions, through: :memberships

  validates :name, presence: true
  validates :email, presence: true
  validates :uid, uniqueness: true

  def self.from_oauth(uid, profile)
    user = User.where(:uid => uid).first
    if user
      user
    else
      User.create(uid: uid, 
                  name: profile[:name],
                  email: profile[:email],
                  image_url: profile[:image])
    end
  end

  def is_manager?
    managements.length != 0
  end

  def is_member?
    memberships.length != 0
  end
end
