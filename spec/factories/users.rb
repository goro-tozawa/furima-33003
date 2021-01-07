FactoryBot.define do
   factory :user do
      nickname                                       {"test"}
      email                                       {"test@example"}
      password                                     {"aaaa00"}
      encrypted_password                    {"aaaa00"}
      last_name                                     {"テスト"}
      first_name                                    {"テスト"}
      last_kana                                     {"アアア"}
      first_kana                                    {"アアア"}
      birthday                                        {"1111-11-11"}
    end
  end