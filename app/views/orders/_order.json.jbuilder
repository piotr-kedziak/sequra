json.extract! order, :id, :merchant_id, :shopper_id, :amount, :completed_at, :created_at, :updated_at
json.url order_url(order, format: :json)
