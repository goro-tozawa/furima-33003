require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー管理機能" do
    it "nicknameが空では登録できない"do
      user = User.new(nickname: "", email: "test@example", password: "000000", encrypted_password: "000000", last_name:"test", first_name: "test", last_kana: "アアア",  first_kana: "アアア", birthday: "0000,00,00")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない"do
      user = User.new(nickname: "test", email: "", password: "000000", encrypted_password: "000000", last_name:"test", first_name: "test", last_kana: "アアア",  first_kana: "アアア", birthday: "0000,00,00")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    
    it ""do
    end
    it ""do
    end
    it ""do
    end
    it ""do
    end
  end
end
