class DisbursementsProcessing
  def initialize(merchant:, start_date: nil, end_date: nil)
    @merchant = merchant
    @start_date = start_date || 1.week.ago.beginning_of_week
    @end_date = end_date || 1.week.ago.end_of_week
  end

  def call
    return if calculated_fee == 0

    create_disbursement
  end

  protected

  attr_reader :merchant, :start_date, :end_date

  def orders
    merchant.orders.completed.where(completed_at: start_date..end_date)
  end

  def calculated_fee
    @fee ||= DisbursementsFeeCalculation.new(orders: orders).call
  end

  def create_disbursement
    Disbursement.create!(
      merchant:,
      fee:              calculated_fee,
      calculated_at:    Time.zone.now,
      calculated_since: start_date,
      calculated_to:    end_date
    )
  end
end
