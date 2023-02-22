json.extract! merchant, :id, :name, :email, :cif, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
