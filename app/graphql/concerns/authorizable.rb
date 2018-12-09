# frozen_string_literal: true

module Authorizable
  extend ActiveSupport::Concern

  def ready?(**args)
    policy = MutationPolicy.new context[:current_user], args
    action = "#{context.query.operation_name.underscore}?"

    if policy.send action
      true
    else
      [false, {
        :errors => [I18n.t('pundit.unauthorized')]
      }]
    end
  end
end
