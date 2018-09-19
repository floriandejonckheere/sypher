# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    ##
    # Attributes
    #
    text { Faker::Lorem.words(10).join(' ') }
    uuid { SecureRandom.uuid }

    ##
    # Associations
    #
    user { create :user }
    channel { create %i[group conversation].sample }
  end
end
