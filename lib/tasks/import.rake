namespace :import do
  desc 'Import Data from JSON'
  task json: :environment do
    merchants_file = File.read(Rails.root.join('dataset', 'merchants.json'))
    shoppers_file = File.read(Rails.root.join('dataset', 'shoppers.json'))
    orders_file = File.read(Rails.root.join('dataset', 'orders.json'))

    p 'importing Merchants'
    JSON.parse(merchants_file)['RECORDS'].each do |merchant_data|
      Merchant.find_or_create_by(merchant_data.symbolize_keys)
    end

    p 'importing Shopers'
    JSON.parse(shoppers_file)['RECORDS'].each do |shopper_data|
      Shopper.find_or_create_by(shopper_data.symbolize_keys)
    end

    p 'importing Orders'
    JSON.parse(orders_file)['RECORDS'].each do |order_data|
      order_data.symbolize_keys!
      Order.find_or_create_by(id: order_data[:id]) do |order|
        order.merchant = Merchant.find(order_data[:merchant_id])
        order.shopper = Shopper.find(order_data[:shopper_id])
        order.amount = order_data[:amount].to_f
        order.created_at = Time.parse(order_data[:created_at]) if order_data[:created_at].present?
        order.completed_at = Time.parse(order_data[:completed_at]) if order_data[:completed_at].present?
      end
    end

    p 'done 😅'
  end
end
