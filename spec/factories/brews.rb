FactoryBot.define do
  factory :brew do
    name "The Abyss"
    abv 0.11
    ibus 30
    classification "Imperial Stout"
    brewery

    trait :low_ibus do
      name "The Abyss"
      abv 0.11
      ibus 30
      classification "Imperial Stout"
    end

    trait :med_ibus do
      name "Mirror Pond Pale Ale"
      abv 0.05 
      ibus 40 
      classification "Pale Ale" 
    end

    trait :high_ibus do
      name "Red Chair Pale Ale" 
      abv 0.062 
      ibus 60
      classification "North West Pale Ale"
    end

  end
end