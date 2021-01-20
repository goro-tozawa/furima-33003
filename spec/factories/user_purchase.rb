FactoryBot.define do
  factory :user_purchase do
    postal_code                                    {"111-1111"}
    area_id                                              {2}
    municipality                                     {"横浜市"}
    address                                             {"test2-54-41"}
    phone_number                                {12345678910}
    building_name                                  {"test"}
    token {"tok_abcdefghijk00000000000000000"}
  
   end
 end