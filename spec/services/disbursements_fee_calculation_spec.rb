require 'rails_helper'

RSpec.describe DisbursementsFeeCalculation do
  let!(:merchant) { create(:merchant) }
  let(:orders) { Order.none }

  describe '#call' do
    subject { described_class.new(orders: orders) }

    context 'without orders' do
      it 'returns 0' do
        expect(subject.call).to eq 0
      end
    end

    context 'with orders of amount less than 50' do
      let!(:order) { create(:order, :completed, merchant: merchant, amount: 49.00) }
      let(:orders) { Order.where(id: order.id) }

      it 'returns 1' do
        expect(subject.call).to eq 1
      end
    end

    context 'with orders of amount of 50' do
      let!(:order) { create(:order, :completed, merchant: merchant, amount: 50.00) }
      let(:orders) { Order.where(id: order.id) }

      it 'returns 0.95' do
        expect(subject.call).to eq 0.95
      end
    end

    context 'with orders of amount between 50 and 300' do
      let!(:order) { create(:order, :completed, merchant: merchant, amount: 250.00) }
      let(:orders) { Order.where(id: order.id) }

      it 'returns 0.95' do
        expect(subject.call).to eq 0.95
      end
    end

    context 'with orders of amount of 300' do
      let!(:order) { create(:order, :completed, merchant: merchant, amount: 300.00) }
      let(:orders) { Order.where(id: order.id) }

      it 'returns 0.85' do
        expect(subject.call).to eq 0.85
      end
    end

    context 'with orders of amount more than 300' do
      let!(:order) { create(:order, :completed, merchant: merchant, amount: 1300.00) }
      let(:orders) { Order.where(id: order.id) }

      it 'returns 0.85' do
        expect(subject.call).to eq 0.85
      end
    end
  end
end
