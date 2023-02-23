module Api
  module V1
    class MerchantsController < BaseController
      before_action :set_merchants, only: :index
      before_action :set_merchant, only: :show

      def index; end

      def show; end

      private

      def set_merchants
        @merchants = Merchant.includes(:disbursements).all
      end

      def set_merchant
        @merchant = Merchant.includes(:disbursements).find(params[:id])
      end
    end
  end
end
