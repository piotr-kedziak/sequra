require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  it_behaves_like 'timestampable'

  describe '#merchant' do
    it { is_expected.to belong_to(:merchant).touch(true) }
  end

  describe '#calculated_at' do
    it { is_expected.to validate_presence_of :calculated_at }
  end

  describe '#calculated_since' do
    it { is_expected.to validate_presence_of :calculated_since }
  end

  describe '#calculated_to' do
    it { is_expected.to validate_presence_of :calculated_to }
  end

  describe '#fee' do
    it { is_expected.to validate_presence_of :fee }
    it { is_expected.to validate_numericality_of(:fee).is_greater_than(0) }
  end
end
