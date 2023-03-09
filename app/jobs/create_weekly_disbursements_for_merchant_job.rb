class CreateWeeklyDisbursementsForMerchantJob < ApplicationJob
  # may be disbursement queue in the future
  queue_as :default

  def perform(merchant_id, start_date, end_date)
    merchant = Merchant.find(merchant_id)

    DisbursementsProcessing.new(merchant: merchant, start_date: start_date, end_date: end_date).call
  end
end
