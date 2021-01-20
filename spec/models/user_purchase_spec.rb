require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    sleep(0.1)
    @user_purchase = FactoryBot.build(:user_purchase, user_id: user, item_id: item)
  end

  describe "商品購入昨日" do

    context"保存できる場合" do
        it"token,postal_code,area_id,municipality,address,phone_numberが存在すれば購入ができる"do
          expect(@user_purchase).to be_valid
        end

        it"建物名がなくても購入できる"do
          @user_purchase.building_name = nil
          expect(@user_purchase).to be_valid
        end
     end

    context"保存できない場合" do
        it "tokenが空では登録できないこと" do
            @user_purchase.token = nil
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
        @user_purchase.municipality = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Municipality can't be blank")
        end

        it"addressが空では保存できない"do
        @user_purchase.address = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
        end

        it"phone_numberが空では保存できない"do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
        end

        it"phone_numberは11桁以内でないと保存できない"do
        @user_purchase.phone_number = 123456789012
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Please write within 11 digits with only numbers")
        end

        it"phone_numberが英数混合では登録できないこと"do
        @user_purchase.phone_number = "1a2a3a4a5"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Please write within 11 digits with only numbers")
        end

        it"user_idは空では保存できない"do
        @user_purchase.user_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
        end

        it"item_idは空では保存できない"do
        @user_purchase.item_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
        end

        
   end
 end
end
