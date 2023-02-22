class Order < ApplicationRecord
  belongs_to :merchant, touch: true
  belongs_to :shopper, touch: true

  monetize :amount_cents

  scope :completed, -> { where.not(completed_at: nil) }

  def completed?
    completed_at.present?
  end

  def not_completed?
    !completed?
  end
end
