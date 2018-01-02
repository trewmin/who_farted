class Fart < ApplicationRecord
  belongs_to :group

  belongs_to :smelter, class_name: 'User'
  has_one :delter, class_name: 'User'

end
