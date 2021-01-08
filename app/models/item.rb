class Item < ApplicationRecord
  belong_to :user
  has_one_attached :image
 
  with_options presence: true do

  validates :image
  validates :item_name
  validates :details
  validates :price format: { with:/\A([1-9]{300,9999999}\d*,)*[1-9]{300,9999999}\d*\z/  message: "
  Please enter the price between ¥ 300 and ¥ 999999"}

  end
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :state_id
  validates :burden_id
  validates :area_id
  validates :day_id

 end

end
