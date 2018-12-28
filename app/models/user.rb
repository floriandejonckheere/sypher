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
  property :last_seen_at

  # Privacy settings (read notifications and last seen at)
  enum :read_scope => { :nobody => 0, :contacts => 1 },
       :_prefix => :read_by

  enum :seen_scope => { :nobody => 0, :contacts => 1, :everyone => 2 },
       :_prefix => :seen_by

  # Phone verification PIN
  property :pin
  property :pin_sent_at

  ##
  # Associations
  #
  has_many :messages,
           :dependent => :destroy

  has_many :memberships,
           :dependent => :destroy

  has_many :channels,
           :through => :memberships

  has_many :contacts,
           :dependent => :destroy

  has_many :contact_users,
           :through => :contacts,
           :source => :contact

  ##
  # Validations
  #
  phony_normalize :phone

  validates :phone,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :phony_plausible => true

  validates :name,
            :length => { :maximum => 20 }

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
  after_initialize :set_default_scopes,
                   :set_last_seen_at

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
    self.verified_at = Time.now.utc
    increment :token_version
    save
  end

  def verify_with_pin(sent_pin)
    if sent_pin.to_i != pin
      errors.add :pin, :invalid
      return false
    end

    if pin_expired?
      errors.add :pin, :expired
      return false
    end

    verify
  end

  def send_verification_pin
    self.pin = rand 100_000..999_999
    self.pin_sent_at = Time.now.utc

    save

    # TODO: call SMS API
    Rails.logger.info "Sent verification PIN #{pin} to #{phone}"
  end

  def pin_expired?
    return true unless pin_sent_at

    Time.now.utc > (pin_sent_at + Rails.configuration.pin_expiration_period)
  end

  ##
  # Overrides
  #
  def find_by_token(params)
    User.verified.find_by params
  end

  def touch
    super

    self.last_seen_at = Time.now.utc
    save
  end

  ##
  # Helpers and callback methods
  #
  def set_default_scopes
    self.read_scope = :contacts unless read_scope?
    self.seen_scope = :everyone unless seen_scope?
  end

  def set_last_seen_at
    self.last_seen_at = Time.now.utc
  end
end
