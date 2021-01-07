FactoryBot.define do
  factory :wom do
    user { nil }
    store { nil }
    content { "MyText" }
    title { "MyString" }
    rate { 1.5 }
    visit_date { "2021-01-02" }
  end
end
