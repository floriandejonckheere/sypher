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
    ##
    # Factories
    #
    factory :conversation, :class => Conversation do
      ##
      # Attributes
      #
      type { 'Conversation' }

      ##
      # Associations
      #
      before :create do |c|
        2.times { c.memberships << build(:membership, :channel => c) }
      end
    end

    factory :group, :class => Group do
      ##
      # Attributes
      #
      type { 'Group' }
      name { Faker::Lorem.words(4).join ' ' }

      ##
      # Associations
      #
      before :create do |g|
        5.times { g.memberships << build(:membership, :channel => g) }
      end
    end
  end
end
