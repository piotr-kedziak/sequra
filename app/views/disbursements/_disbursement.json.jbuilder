json.extract! disbursement, :id, :merchant_id, :fee, :calculated_at, :calculated_since, :calculated_to, :created_at, :updated_at
json.url disbursement_url(disbursement, format: :json)
