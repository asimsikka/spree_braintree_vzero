module Spree
  module Admin
    module Orders
      module CustomerDetails
        class Form
          def self.register
            Deface::Override.new(
              virtual_path: 'spree/admin/orders/customer_details/_form',
              name: 'admin_address_one_validation',
              remove: "erb[loud]:contains('error_message_on')"
            )
          end
        end
      end
    end
  end
end

Spree::Admin::Orders::CustomerDetails::Form.register
