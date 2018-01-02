class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true

  has_many :memberships
  has_many :groups, through: :memberships

  has_many :smelt_farts, class_name: 'Farts', foreign_key: "smelter_id"
  has_many :delt_farts, class_name: 'Farts', foreign_key: "delter_id"

  has_many :admin_groups, class_name: 'Groups', foreign_key: "admin_id"

end
