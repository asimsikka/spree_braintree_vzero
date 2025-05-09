module Spree
  module Admin
    module Shared
      class OrderSummary
        def self.register
          Deface::Override.new(
            virtual_path: 'spree/admin/shared/_order_summary',
            name: 'add_settled_column_to_payment',
            insert_bottom: '[data-hook="order_tab_summary_payment_total"]',
            text: '<dt>Settled:</dt><dd><%= @order.payment_settled? %></dd>'
          )
        end
      end
    end
  end
end

Spree::Admin::Shared::OrderSummary.register
