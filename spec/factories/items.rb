FactoryBot.define do
  factory :item do
    name { "MyString" }
    image { "MyString" }
    price { "MyString" }
    user { nil }
    store { nil }
  end
end
