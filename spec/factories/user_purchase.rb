FactoryBot.define do
  factory :user_purchase do
    postal_code                                    {"111-1111"}
    area_id                                             {"2"}
    municipality                                     {"横浜市"}
    address                                             {"2-54-41"}
    phone_number                                {12345678910}
    token {"tok_abcdefghijk00000000000000000"}
    user_id                                             {"1"}
    item_id                                             {"1"}
   end
 end