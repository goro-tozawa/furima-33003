class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :municipality, :address, :phone_number, :area_id, :building_name, :token
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with:/\A\d{11}\z/, message: "Please enter the phone number within 11 digits" }
    validates :token
    validates :user_id
    validates :item_id
  end
  
    validates :area_id, numericality: { other_than: 1 }
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Domicile.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name,purchase_id: purchase.id)
  end

  
  
end