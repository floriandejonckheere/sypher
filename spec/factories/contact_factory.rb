# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    ##
    # Attributes
    #
    ##
    # Associations
    #
    user { build :user }
    contact { build :user }

    ##
    # Factories
    #
  end
end
