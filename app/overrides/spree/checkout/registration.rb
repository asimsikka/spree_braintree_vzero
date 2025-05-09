module Spree
  module Checkout
    class Registration
      def self.register
        Deface::Override.new(
          virtual_path: 'spree/checkout/registration',
          name: 'Set proper email',
          insert_after: 'erb[loud]:contains("form_for")',
          text: '<% @order.email ||= params[:paypal_email] %>'
        )
      end
    end
  end
end

Spree::Checkout::Registration.register