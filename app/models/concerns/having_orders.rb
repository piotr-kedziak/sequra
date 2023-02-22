# frozen_string_literal: true

module HavingOrders
  extend ActiveSupport::Concern

  included do
    has_many :orders, dependent: :nullify
  end
end
