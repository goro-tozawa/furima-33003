require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe "商品購入昨日" do

    context"保存できる場合" do
      it"token,postal_code,area_id,municipality,address,phone_numberが存在すれば購入ができる"do
        expect(@user_purchase).to be_valid
      end
    end

    context"保存できない場合" do
         
      it "tokenが空では登録できないこと" do
        @user_purchase.token = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it"postal_codeが空では保存ができない"do
      @user_purchase.postal_code = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      
      
      
      it"postal_code内に「-」がないと保存ができない"do
      @user_purchase.postal_code = "1111111"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    
    it"area_idは2以上でなければ保存できない"do
    @user_purchase.area_id = "1"
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Area must be other than 1")
    end

    it"municipalityが空では保存できない"do
    @user_purchase.municipality = ""
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Municipality can't be blank")
    end

    it"addressが空では保存できない"do
    @user_purchase.address = ""
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
    end

    it"phone_numberが空では保存できない"do
    @user_purchase.phone_number = ""
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it"phone_numberは11桁以内でないと保存できない"do
    @user_purchase.phone_number = 123456789012
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number Please enter the phone number within 11 digits")
    end

end
  
end
end
