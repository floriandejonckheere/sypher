# frozen_string_literal: true

##
# User account
#
class User < ApplicationRecord
  ##
  # Properties
  #
  property :phone
  property :name

  # Phone verification PIN
  property :pin

  ##
  # Associations
  #
  has_many :messages,
           :dependent => :destroy,
           :foreign_key => 'receiver_id'

  has_many :memberships,
           :dependent => :destroy

  has_many :groups,
           :through => :memberships

  ##
  # Validations
  #
  phony_normalize :phone

  validates :phone,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :phony_plausible => true

  validates :name,
            :presence => true

  validates :pin,
            :format => {
              :allow_blank => true,
              :with => /\A[0-9]{6}\z/
            }

  ##
  # Scopes
  #
  scope :verified,
        -> { where.not(:verified_at => nil) }

  ##
  # Callbacks
  #
  ##
  # Class methods
  #
  def self.find_by_phone(phone)
    User.find_by :phone => PhonyRails.normalize_number(phone)
  end

  ##
  # Instance methods
  #
  def verified?
    !verified_at.nil?
  end

  def verify
    if verified?
      errors.add :phone, :already_verified
      return false
    end

    if pin_expired?
      errors.add :pin, :expired
      return false
    end

    self.verified_at = Time.now.utc
    save
  end

  def verify_with_pin(sent_pin)
    if sent_pin.to_i != pin
      errors.add :pin, :invalid
      return false
    end

    verify
  end

  def send_verification_pin
    if verified?
      errors.add :phone, :already_verified
      return false
    end

    self.pin = rand.to_s[2..7].to_i
    self.pin_sent_at = Time.now.utc

    save

    # TODO: call SMS API
    Rails.logger.info "Sent verification PIN #{pin} to #{phone}"
  end

  private

  def pin_expired?
    true unless pin_sent_at

    Time.now.utc > (pin_sent_at + Rails.configuration.pin_expiration_period)
  end

  ##
  # Overrides
  #
  ##
  # Helpers and callback methods
  #
end
