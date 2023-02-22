require 'rails_helper'

RSpec.describe Order, type: :model do
  it_behaves_like 'timestampable'

  describe '#merchant' do
    it { is_expected.to belong_to :merchant }
  end

  describe '#shopper' do
    it { is_expected.to belong_to :shopper }
  end

  describe '#amount' do
    it { is_expected.to monetize(:amount) }
  end

  describe '#completed_at' do
    it { is_expected.to respond_to :completed_at }
  end
end
