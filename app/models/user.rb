class User < ApplicationRecord
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname

    
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password,with: PASSWORD_REGEX, message: "both letters and numbers"
    
    validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Last name is invalid. Input full-width characters."}
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "First name is invalid. Input full-width characters."}

    validates :last_kana, format:{with: /\A[ァ-ヶー－]+\z/}
    validates :first_kana, format:{with: /\A[ァ-ヶー－]+\z/}
    validates :birthday  

  end
end
