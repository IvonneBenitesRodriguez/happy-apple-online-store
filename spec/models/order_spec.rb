require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it 'is valid with shipping_address, phone and payment_method' do
      user = User.create!(email_address: 'order_test@happyapple.com', password: 'password123')
      order = Order.new(
        user: user,
        shipping_address: 'Berlin, Germany',
        phone: '+49123456789',
        payment_method: 'credit_card',
        total: 24.0
      )
      expect(order).to be_valid
    end

    it 'is invalid without shipping_address' do
      user = User.create!(email_address: 'order_test2@happyapple.com', password: 'password123')
      order = Order.new(user: user, phone: '+49123456789', payment_method: 'credit_card', total: 24.0)
      expect(order).not_to be_valid
    end

    it 'is invalid without phone' do
      user = User.create!(email_address: 'order_test3@happyapple.com', password: 'password123')
      order = Order.new(user: user, shipping_address: 'Berlin', payment_method: 'credit_card', total: 24.0)
      expect(order).not_to be_valid
    end

    it 'is invalid with an unsupported payment method' do
      user = User.create!(email_address: 'order_test4@happyapple.com', password: 'password123')
      order = Order.new(user: user, shipping_address: 'Berlin', phone: '+49123456789', payment_method: 'crypto', total: 24.0)
      expect(order).not_to be_valid
    end
  end
end