FactoryBot.define do
  factory :user do
    full_name { "John Doe" }
    sequence(:email_address) { |n| "john@example#{n}.com" }
    password { "secretpassword" }
    sequence(:auth_token) { |n| "auth_token#{n}" }
  end
end
