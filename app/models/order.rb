class Order < ApplicationRecord
  belongs_to :merchant, touch: true
  belongs_to :shopper, touch: true

  monetize :amount_cents
end
