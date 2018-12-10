FactoryBot.define do
  factory :user do
    name { 'Kristen' }
    email { 'kristen@martino.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
