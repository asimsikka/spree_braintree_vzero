module Spree
  module Admin
    module PaymentMethods
      class Form
        def self.register
          Deface::Override.new(
            virtual_path: 'spree/admin/payment_methods/_form',
            name: 'include_braintree_vzero_config_form',
            replace: '[data-hook="admin_payment_method_form_preferences"]',
            partial: 'spree/admin/payment_methods/braintree_vzero_form'
          )
        end
      end
    end
  end
end

Spree::Admin::PaymentMethods::Form.register
