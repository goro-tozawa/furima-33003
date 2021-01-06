class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,presence: true
  validates :encrypted_password, presence: true    

  validates :encrypted_password,:password,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}

  validates :last_name, presence: true    
  validates :first_name, presence: true    
  validates :last_kana, presence: true    
  validates :last_kana, presence: true    
  validates :first_kana, presence: true    
  validates :birthday, presence: true   

 has_many :items
end
