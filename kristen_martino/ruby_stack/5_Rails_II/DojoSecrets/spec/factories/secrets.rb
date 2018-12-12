FactoryBot.define do
  factory :secret do
    content { "MyText" }
    user
  end
end
