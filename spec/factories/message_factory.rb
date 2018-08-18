# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    ##
    # Attributes
    #
    text { Faker::Lorem.words(10).join(' ') }

    ##
    # Associations
    #
    sender { build :user }
    receiver { build :user }
  end
end
