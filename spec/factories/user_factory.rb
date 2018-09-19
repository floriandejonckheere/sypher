# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    ##
    # Attributes
    #
    phone { "#{['0032', '+32'].sample}4#{[7, 8, 9].sample}#{rand.to_s[2..8]}" }
    name { Faker::Name.name }
    last_seen_at { Faker::Date.backward 14 }

    trait :verified do
      verified_at { Time.now }
    end

    ##
    # Associations
    #
    trait :with_messages do
      before :create do |u|
        10.times { u.messages << build(:message, :user => u) }
      end
    end

    trait :with_memberships do
      before :create do |u|
        5.times { u.memberships << build(:membership, :user => u) }
      end
    end
  end
end
