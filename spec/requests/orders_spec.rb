# spec/requests/orders_spec.rb
require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { User.create!(email_address: "buyer@example.com", password: "password123") }

  before do
    post session_path, params: { email_address: user.email_address, password: "password123" }
  end

  describe "GET /orders/new" do
    it "redirects to the cart when it is empty" do
      get new_order_path
      expect(response).to redirect_to(cart_path)
    end
  end

  describe "GET /orders/:id" do
    let!(:order) do
      Order.create!(
        user: user,
        shipping_address: "Calle Falsa 123, Lima, Peru",
        phone: "999888777",
        payment_method: "paypal",
        total: 25.0,
        status: "pending"
      )
    end

    it "returns http success for the order owner" do
      get order_path(order)
      expect(response).to have_http_status(:success)
    end

    it "shows the order's shipping address" do
      get order_path(order)
      expect(response.body).to include(order.shipping_address)
    end
  end

  describe "IDOR protection on GET /orders/:id" do
    let(:other_user) { User.create!(email_address: "owner@example.com", password: "password123") }

    let!(:others_order) do
      Order.create!(
        user: other_user,
        shipping_address: "Av. Siempre Viva 742, Springfield",
        phone: "111222333",
        payment_method: "paypal",
        total: 50.0,
        status: "pending"
      )
    end

  it "returns 404 when a logged-in user tries to view another user's order" do
    get order_path(others_order)
    expect(response).to have_http_status(:not_found)
  end

  it "does not leak the other user's shipping address" do
    get order_path(others_order)
    expect(response.body).not_to include(others_order.shipping_address)
  end
  end
end