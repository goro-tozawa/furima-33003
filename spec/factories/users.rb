FactoryBot.define do
   factory :user do
      nickname                                       {"test"}
      email                                       {Faker::Internet.free_email}
      password                                     {"aaaa00"}
      password_confirmation                    {"aaaa00"}
      last_name                                     {"テスト"}
      first_name                                    {"テスト"}
      last_kana                                     {"アアア"}
      first_kana                                    {"アアア"}
      birthday                                        {"1111-11-11"}
    end
  end