class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :memberships
  has_many :users, through: :memberships

  has_many :farts

  belongs_to :admin, class_name: 'User'

end
