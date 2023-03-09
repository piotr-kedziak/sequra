json.cache! [merchant], expires_in: 1.hour do
  json.extract! merchant, :id, :name, :email, :cif, :created_at, :updated_at
  json.url api_v1_merchant_path(merchant, format: :json)
  json.disbursements merchant.disbursements, partial: 'api/v1/disbursements/disbursement', as: :disbursement
end
