FactoryBot.define do

  factory :user do
    nickname                 { "abeabeabe" }
    email                    { "kkk@gmail.com" }
    password                 { "hogehoge" }
    password_confirmation    { "hogehoge" }
    first_name               { "やまだ" }
    last_name                { "やまだ" }
    first_name_phonetic      { "やまだ" }
    last_name_phonetic       { "やまだ" }
    birthday                 { "2020-06-15 05:38:12.077276" }
    send_first_name          { "やまだ" }
    send_last_name           { "やまだ" }
    send_first_name_phonetic { "やまだ" }
    send_last_name_phonetic  { "やまだ" }
    postal_code              { "00000000" }
    prefectures              { "00000000" }
    city                     { "00000000" }
    address                  { "00000000" }
    condominuium_name        { "00000000" }
    phone_number             { "00000000" }
  end

end