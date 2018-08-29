# frozen_string_literal: true

FactoryBot.define do
  factory :membership do
    ##
    # Attributes
    #
    admin { [true, false].sample }

    ##
    # Associations
    #
    user { build :user }
    channel { build :channel }
  end
end
