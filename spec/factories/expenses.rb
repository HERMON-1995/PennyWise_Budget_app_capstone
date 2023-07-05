FactoryBot.define do
  factory :expense do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
    author_id { FactoryBot.create(:user).id }
  end
end
