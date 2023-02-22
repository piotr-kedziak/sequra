FactoryBot.define do
  factory :order do
    merchant
    shopper

    trait :completed do
      completed_at { 1.day.ago }
    end

    trait :not_completed do
      # default
    end
  end
end
