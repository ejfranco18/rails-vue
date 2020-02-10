FactoryBot.define do
  factory :movie do
    sequence(:name) { |n| "movie#{n}" }
    description { "MyText" }
    year { 1 }
    ranking { 1 }
    category { nil }
  end
end
