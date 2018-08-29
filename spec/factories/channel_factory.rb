# frozen_string_literal: true

FactoryBot.define do
  factory :channel do
    ##
    # Attributes
    #
    topic { Faker::Lorem.words(4).join ' ' }
    type { %w[Conversation Group].sample }

    ##
    # Associations
    #
    trait :memberships do
      before :create do |c|
        build_list :membership, 5, :channel => c
      end
    end

    ##
    # Factories
    #
    factory :conversation, :class => Conversation do
      type { 'Conversation' }
    end

    factory :group, :class => Group do
      type { 'Group' }
      name { Faker::Lorem.words(4).join ' ' }
    end
  end
end
