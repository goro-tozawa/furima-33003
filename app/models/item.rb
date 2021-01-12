class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  
  belongs_to :user
  has_one_attached :image

  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :details
    validates :category
    validates :state
    validates :burden
    validates :area
    validates :day
    validates :price
  end
  
    validates_inclusion_of :price , in: 300..9_999_999, message: 'Please enter between ¥ 300 and ¥ 9,99,999'  

    with_options numericality: { other_than: 1 } do
     validates :category_id
     validates :state_id
     validates :burden_id
     validates :area_id
     validates :day_id
    end
end
