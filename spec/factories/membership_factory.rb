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
    user { create :user }
    channel { create %i[group conversation].sample }
  end
end
