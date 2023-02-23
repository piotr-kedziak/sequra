require 'rails_helper'

RSpec.describe CreateWeeklyDisbursementsJob, type: :job do
  let!(:merchants) { create_list(:merchant, 5) }

  describe 'performs jobs for each merchant' do
    before do
      allow(CreateWeeklyDisbursementsForMerchantJob).to receive(:perform_later)
    end

    it 'creates CreateWeeklyDisbursementsForMerchantJob for each merchant' do
      expect(CreateWeeklyDisbursementsForMerchantJob).to receive(:perform_later).exactly(merchants.size).times

      CreateWeeklyDisbursementsJob.perform_now
    end
  end
end
