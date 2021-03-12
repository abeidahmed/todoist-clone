FactoryBot.define do
  factory :user do
    full_name { "MyString" }
    email_address { "MyString" }
    password_digest { "MyString" }
    auth_token { "MyString" }
  end
end
