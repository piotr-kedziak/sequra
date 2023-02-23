class Disbursement < ApplicationRecord
  belongs_to :merchant, touch: true

  validates :calculated_at, :calculated_since, :calculated_to, :fee, presence: true
  validates :fee, numericality: { greater_than: 0 }
end
