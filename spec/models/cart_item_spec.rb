require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'associations' do
    it 'belongs to a cart' do
      item = CartItem.new
      expect(item).to respond_to(:cart)
    end

    it 'belongs to a product' do
      item = CartItem.new
      expect(item).to respond_to(:product)
    end
  end

  describe 'validations' do
    it 'is invalid with quantity less than or equal to 0' do
      user = User.create!(email_address: 'item_test@happyapple.com', password: 'password123')
      cart = Cart.create!(user: user)
      product = Product.create!(name: 'Test Coffee', price: 2.0, description: 'Test', benefits: 'Test', category: 'Coffee')
      item = CartItem.new(cart: cart, product: product, quantity: 0)
      expect(item).not_to be_valid
    end

    it 'is valid with quantity greater than 0' do
      user = User.create!(email_address: 'item_test2@happyapple.com', password: 'password123')
      cart = Cart.create!(user: user)
      product = Product.create!(name: 'Test Coffee 2', price: 2.0, description: 'Test', benefits: 'Test', category: 'Coffee')
      item = CartItem.new(cart: cart, product: product, quantity: 1)
      expect(item).to be_valid
    end
  end
end