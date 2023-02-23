require 'rails_helper'

RSpec.describe Order, type: :model do
  it_behaves_like 'timestampable'

  describe '.completed' do
    subject { described_class.completed }

    let!(:completed_order) { create(:order, :completed) }
    let!(:not_completed_order) { create(:order, :not_completed) }

    it 'returns completed orders' do
      expect(subject).to include(completed_order)
    end

    it 'does not return not completed orders' do
      expect(subject).not_to include(not_completed_order)
    end
  end

  describe '#merchant' do
    it { is_expected.to belong_to(:merchant).touch(true) }
  end

  describe '#shopper' do
    it { is_expected.to belong_to(:shopper).touch(true) }
  end

  describe '#amount' do
    it { is_expected.to monetize(:amount) }
  end

  describe '#completed_at' do
    it { is_expected.to respond_to :completed_at }
  end

  describe '#completed?' do
    context 'with a completed order' do
      let(:order) { build(:order, :completed) }

      it 'returns true' do
        expect(order.completed?).to be_truthy
      end
    end

    context 'with a not completed order' do
      let(:order) { build(:order, :not_completed) }

      it 'returns false' do
        expect(order.completed?).to be_falsey
      end
    end
  end

  describe '#not_completed?' do
    context 'with a completed order' do
      let(:order) { build(:order, :completed) }

      it 'returns false' do
        expect(order.not_completed?).to be_falsey
      end
    end

    context 'with a not completed order' do
      let(:order) { build(:order, :not_completed) }

      it 'returns true' do
        expect(order.not_completed?).to be_truthy
      end
    end
  end
end
