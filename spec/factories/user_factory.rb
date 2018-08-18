# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    ##
    # Attributes
    #
    phone { "#{['0032', '+32'].sample}4#{[7, 8, 9].sample}#{rand.to_s[2..8]}" }
    name { Faker::Name.name }

    ##
    # Associations
    #
    trait :with_messages do
      after :create do |u|
        create_list :message, 10, :receiver => u
      end
    end

    trait :with_memberships do
      after :create do |u|
        create_list :membership, 5, :user => u
      end
    end
  end
end
