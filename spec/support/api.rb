shared_context 'API' do
  let(:valid_token) { Rails.application.secrets.api_key }
  let(:valid_headers) do
    {
      'Authorization' => "Bearer #{valid_token}",
      'Content-Type'  => 'application/json'
    }
  end
  let(:invalid_headers) do
    {
      'Authorization' => nil,
      'Content-Type'  => 'application/json'
    }
  end
end
