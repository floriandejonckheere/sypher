# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Membership do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Subject
  #
  subject(:membership) { build :membership }

  ##
  # Test variables
  #
  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to allow_values(true, false).for :admin }
    it { is_expected.not_to allow_values(nil, '').for :admin }

    it { is_expected.to allow_value('foobar').for :nickname }

    it { is_expected.to allow_value(true).for :admin }
    it { is_expected.to allow_value(false).for :admin }

    it 'is valid with all attributes' do
      expect(build :membership).to be_valid
    end

    it 'is invalid without admin' do
      expect(build :membership, :admin => nil).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :channel }

    describe 'two memberships with the same user and channel' do
      let(:membership) { create :membership }

      it 'raises ActiveRecord::RecordInvalid' do
        expect { create :membership, :user => membership.user, :channel => membership.channel }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
