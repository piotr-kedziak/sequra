class Merchant < ApplicationRecord
  include HavingOrders

  has_many :disbursements, dependent: :nullify
end
