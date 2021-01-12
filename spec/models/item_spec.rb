require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do

    context"保存できる場合" do
      it"image,item_name,details,category_id, state_id,burden_id,area_id,day_id,priceが存在すれば出品できる"do
        expect(@item).to be_valid
      end
    end

    context"保存できない場合" do
      it"商品名がないと出品することができない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it"商品の説明がないと出品することができない" do
        @item.details = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end

      it"カテゴリーの情報がないと出品することができない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it"カテゴリーはid1では出品することができない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it"商品の状態についての情報がないと出品することができない" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank", "State is not a number")
      end

      it"商品の状態はid1では出品することができない" do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it"配送料の負担の情報がないと出品することができない" do
        @item.burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank", "Burden is not a number")
      end

      it"配送料の負担はid1では出品することができない" do
        @item.burden_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end

      it"発送元の情報がないと出品することができない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it"発送元の情報はid1では出品することができない" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it"発送までの日数の情報がないと出品することができない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it"発送までの日数はid1では出品することができない" do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it"価格についての情報がないと出品することができない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it"価格の設定が、￥299以下では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Please enter between ¥ 300 and ¥ 9,99,999")
      end

      it"価格の設定が、￥10000000以上では出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Please enter between ¥ 300 and ¥ 9,99,999")
      end

      it"価格の数字が全角では出品できない" do
        @item.price = "TEST"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Please enter between ¥ 300 and ¥ 9,99,999")
      end

    end
  end
end
