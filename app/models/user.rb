class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname

    validates :encrypted_password
    
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password,:encrypted_password,with: PASSWORD_REGEX, message: "both letters and numbers"
    
    validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name is invalid. Input full-width characters."}
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name is invalid. Input full-width characters."}


    validates :last_kana,:first_kana,format:{with: /\A[ァ-ヶー－]+\z/}

    validates :birthday  

  end
  has_many :items
end
