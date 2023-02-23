module Api
  class BaseController < ::ApplicationController
    before_action :restrict_access

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    protected

    def restrict_access
      # authenticate_or_request_with_http_token do |token, _options|
      #   ActiveSupport::SecurityUtils.secure_compare(
      #     ::Digest::SHA256.hexdigest(token),
      #     ::Digest::SHA256.hexdigest(Rails.application.secrets.api_key)
      #   )
      # end
    end

    def record_not_found
      head :not_found
    end
  end
end
