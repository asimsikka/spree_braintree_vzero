module Spree
  module Checkout
    class NewUser
      def self.register
        Deface::Override.new(
          virtual_path: 'spree/checkout/_new_user',
          name: 'Set proper email',
          insert_after: 'erb[loud]:contains("form_for")',
          text: '<% @user.email ||= params[:paypal_email] %>'
        )
      end
    end
  end
end

Spree::Checkout::NewUser.register