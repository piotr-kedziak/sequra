require 'rails_helper'

RSpec.describe CreateWeeklyDisbursementsForMerchantJob, type: :job do
  let!(:merchant) { create(:merchant) }
  let(:start_date) { 1.week.ago.beginning_of_week }
  let(:end_date) { 1.week.ago.end_of_week }

  describe 'performs job merchant' do
    before do
      allow(DisbursementsProcessing).to receive(:new).and_call_original
    end

    it 'creates CreateWeeklyDisbursementsForMerchantJob for each merchant' do
      expect(DisbursementsProcessing).to receive(:new).with(merchant: merchant, start_date: start_date, end_date: end_date)

      CreateWeeklyDisbursementsForMerchantJob.perform_now(merchant.id, start_date, end_date)
    end
  end
end
