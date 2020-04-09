FactoryBot.define do
  factory :user do
    nickname              {"YAMADA"}
    lastname              {"山田"}
    firstname             {"太郎"}
    lastname_kana         {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birthday              {"2000-01-01"}
    email                 {"yamada@gmail.com"}
    password              {"1234567"}
    password_confirmation {"1234567"}
  end
end