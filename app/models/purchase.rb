class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :domicile
end
