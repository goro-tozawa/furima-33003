require 'rails_helper'

RSpec.describe User, type: :model do
  

  before do
    @user = FactoryBot.build(:user)
  end

 describe "新規登録：ユーザー情報：本人情報確認" do
  
  context '保存できる場合' do
    
          it "nickname,email、password,encrypted_password,last_name,first_name,last_kana,first_kana,birthdayが存在すれば登録できる" do
              expect(@user).to be_valid
          end
   end

  context '保存できない場合' do

        it "nicknameが空では登録できない"do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
        
        it "emailが空では登録できない"do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
        it "重複したemailは登録できない"do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
        it "emaiは@がなければ登録できない"do
        @user.email = "testexample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

        it "passwordが空では登録できない"do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
        end


        it 'passwordは半角英数混合でなければ登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password both letters and numbers")
        end

        it 'passwordは数字のみでは登録できない' do
          @user.password = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password both letters and numbers")
        end

        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordは全角では登録できない' do
          @user.password = 'AAAAAA'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password both letters and numbers")
        end



        it "passwordが存在してもpassword_confirmationが空では登録できない"do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "aaa000"
          @user.password_confirmation = "aaa0000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "ユーザー本名は名字が空では登録できない"do
        @user.last_name = ""
        @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "ユーザー本名は名前が空では登録できない"do
        @user.first_name  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない"do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Last name is invalid. Input full-width characters.")
        end


        it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない"do
        @user.first_name = "test"
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("First name First name is invalid. Input full-width characters.")
        end



        it "ユーザー本名のフリガナの名字は空では登録できない"do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
        end

        it "ユーザー本名のフリガナの名前は空では登録できない"do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
        end

        it "ユーザー本名のフリガナの名字は全角カタカナではないと登録できない"do
        @user.last_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
        end

        it "ユーザー本名のフリガナの名前は全角カタカナではないと登録できない"do
        @user.first_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
        end


        it "生年月日が空では登録できない"do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
    end
  end
end
