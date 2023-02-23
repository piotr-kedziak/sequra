class DisbursementsFeeCalculation
  def initialize(orders: nil)
    @orders = orders
  end

  def call
    return 0 if orders.blank?
    return 0.85 if orders_total_amount >= Money.new(30_000.00)
    return 0.95 if orders_total_amount.between?(Money.new(5000.00), Money.new(30_000.00))

    1 # default
  end

  protected

  attr_reader :orders

  def orders_total_amount
    @sum ||= Money.new(orders.sum(:amount_cents))
  end
end
