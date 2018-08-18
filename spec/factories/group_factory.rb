# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    ##
    # Attributes
    #
    name { Faker::Lorem.words(4).join(' ') }

    ##
    # Associations
    #
    trait :memberships do
      after :create do |g|
        create_list :membership, 5, :group => g
      end
    end
  end
end
