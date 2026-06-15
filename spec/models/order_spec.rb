# spec/models/order_spec.rb
require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { User.create!(email_address: "test@example.com", password: "password123") }

  describe "shipping_address normalization" do
    it "replaces newlines with comma-separated values before saving" do
      order = Order.new(
        user: user,
        shipping_address: "Villa Lane 1020\nFlorida\nUsa",
        phone: "123456",
        payment_method: "paypal",
        total: 10.0,
        status: "pending"
      )
      order.save!
      expect(order.shipping_address).to eq("Villa Lane 1020, Florida, Usa")
    end

    it "leaves addresses without newlines unchanged" do
      order = Order.new(
        user: user,
        shipping_address: "Villa Lane 1020 Apopka Florida 42114",
        phone: "123456",
        payment_method: "paypal",
        total: 10.0,
        status: "pending"
      )
      order.save!
      expect(order.shipping_address).to eq("Villa Lane 1020 Apopka Florida 42114")
    end
  end
end