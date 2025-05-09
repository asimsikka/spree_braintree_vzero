module Spree
  module Admin
    module Shared
      class Refunds
        def self.register
          Deface::Override.new(
            virtual_path: 'spree/admin/shared/_refunds',
            name: 'add_braintree_vzero_refund_link',
            insert_bottom: '[data-hook="refunds"]',
            text: '<%= link_to(image_tag("backend-settle.svg"), settle_admin_order_payment_path(@payment.order, @payment), method: :put, remote: true, class: "fa fa-check  button", confirm: "Are you sure you want to settle this payment?") if @payment.can_be_settled? %>'
          )

          Deface::Override.new(
            virtual_path: 'spree/admin/shared/_refunds',
            name: 'add_braintree_vzero_void_link',
            insert_bottom: '[data-hook="refunds"]',
            text: '<%= link_to_with_icon("fa-undo", Spree.t(:void), void_admin_order_payment_path(@payment.order, @payment), method: :put, remote: true, class: "button", confirm: "Are you sure you want to void this payment?") if @payment.can_be_voided? %>'
          )
        end
      end
    end
  end
end

Spree::Admin::Shared::Refunds.register
