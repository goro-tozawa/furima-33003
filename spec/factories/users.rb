FactoryBot.define do
   factory :user do
      nickname                                       {"test"}
      email                                       {"test@example"}
      password                                     {"000000"}
      encrypted_password                    {"000000"}
      last_name                                     {"test"}
      first_name                                    {"test"}
      last_kana                                     {"アアア"}
      first_kana                                    {"アアア"}
      birthday                                        {"0000,00,00"}
    end
  end