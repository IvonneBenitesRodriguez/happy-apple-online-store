require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      cart = Cart.new
      expect(cart).to respond_to(:user)
    end

    it 'has many cart_items' do
      cart = Cart.new
      expect(cart).to respond_to(:cart_items)
    end
  end

  describe '#total_items' do
    it 'returns 0 when cart is empty' do
      user = User.create!(email_address: 'cart_test@happyapple.com', password: 'password123')
      cart = Cart.create!(user: user)
      expect(cart.total_items).to eq(0)
    end
  end
end