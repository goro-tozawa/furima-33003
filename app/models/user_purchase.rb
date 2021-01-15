class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :municipality, :address, :phone_number, :prefecture_id, :building_name, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with:/\A\d{11}\z/}
    # messageは必要ない？
  end
  
  validates :prefecture_id, numericality: { other_than: 1 }
  # validates :building_name
  # 建物名は自由なのでバリデーションは必要ない？
  
  def save
    Domicile.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name,user_id: user.id)
  end
end