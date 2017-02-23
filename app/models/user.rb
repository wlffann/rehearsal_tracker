class User < ApplicationRecord
  has_many :memberships
  has_many :managements, class_name: 'CompanyManager'
  has_many :companies, through: :managements

  validates :name, presence: true
  validates :email, presence: true
  validates :uid, uniqueness: true

  def self.from_oauth(uid, profile)
    user = User.where(:uid => uid).first
    unless user
      User.create(uid: uid, 
                  name: profile[:name],
                  email: profile[:email],
                  image_url: profile[:image])
    end
  end
end
