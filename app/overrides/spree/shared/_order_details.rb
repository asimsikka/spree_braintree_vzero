module Spree
  module Shared
    class OrderDetails
      def self.register
        Deface::Override.new(
          virtual_path: 'spree/shared/_order_details',
          name: 'Displays payment data for PayPal Express payment methods',
          replace: %{erb[silent]:contains('order.has_step?("payment")')},
          text: '<% if @order.has_step?("payment") || @order.paid_with_paypal_express? %>'
        )
      end
    end
  end
end

Spree::Shared::OrderDetails.register