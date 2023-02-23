require 'rails_helper'

RSpec.describe DisbursementsProcessing do
  let!(:merchant) { create(:merchant) }
  let(:start_date) { 1.week.ago.beginning_of_week }
  let(:end_date) { 1.week.ago.end_of_week }

  describe '#call' do
    subject { described_class.new(merchant:, start_date:, end_date:) }

    context 'without orders' do
      it 'does not create any Disbursement' do
        expect { subject.call }.not_to change { Disbursement.count }
      end
    end

    context 'with orders of amount less than 50' do
      subject(:result) { described_class.new(merchant:, start_date:, end_date:).call }

      before do
        allow(DisbursementsFeeCalculation).to receive_message_chain(:new, :call).and_return(1)
      end

      it 'creates a disbursement' do
        expect(result).to be_a(Disbursement)
      end

      it 'creates a disbursement with a valid fee' do
        expect(result.fee).to eq 1
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_at).not_to be_nil
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_since).to eq start_date
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_to).to eq end_date
      end
    end

    context 'with orders of amount between 50 and 300' do
      subject(:result) { described_class.new(merchant:, start_date:, end_date:).call }

      before do
        allow(DisbursementsFeeCalculation).to receive_message_chain(:new, :call).and_return(0.95)
      end

      it 'creates a disbursement' do
        expect(result).to be_a(Disbursement)
      end

      it 'creates a disbursement with a valid fee' do
        expect(result.fee).to eq 0.95
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_at).not_to be_nil
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_since).to eq start_date
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_to).to eq end_date
      end
    end

    context 'with orders of amount more than 300' do
      subject(:result) { described_class.new(merchant:, start_date:, end_date:).call }

      before do
        allow(DisbursementsFeeCalculation).to receive_message_chain(:new, :call).and_return(0.85)
      end

      it 'creates a disbursement' do
        expect(result).to be_a(Disbursement)
      end

      it 'creates a disbursement with a valid fee' do
        expect(result.fee).to eq 0.85
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_at).not_to be_nil
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_since).to eq start_date
      end

      it 'creates a disbursement with a valid calculated_at field' do
        expect(result.calculated_to).to eq end_date
      end
    end
  end
end
