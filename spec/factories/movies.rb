FactoryBot.define do
  factory :movie do
    name { "MyString" }
    description { "MyText" }
    year { 1 }
    ranking { 1 }
    category { nil }
  end
end
