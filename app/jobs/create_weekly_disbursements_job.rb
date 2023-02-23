class CreateWeeklyDisbursementsJob < ApplicationJob
  # may be disbursement queue in the future
  queue_as :default

  def perform()
    start_date = 1.week.ago.beginning_of_week
    end_date = 1.week.ago.end_of_week

    Merchant.ids.each do |merchant_id|
      CreateWeeklyDisbursementsForMerchantJob.perform_later(merchant_id, start_date, end_date)
    end
  end
end
