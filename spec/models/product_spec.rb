require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'is valid with name, price and description' do
      product = Product.new(
        name: 'Latte Machiatto',
        price: 2.99,
        description: 'Classic Italian coffee',
        benefits: 'Boosts energy',
        category: 'Coffee'
      )
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product = Product.new(price: 2.99)
      expect(product).not_to be_valid
    end

    it 'is invalid without a price' do
      product = Product.new(name: 'Latte Machiatto')
      expect(product).not_to be_valid
    end

    it 'is invalid with a negative price' do
      product = Product.new(name: 'Latte Machiatto', price: -1)
      expect(product).not_to be_valid
    end

it 'is invalid with an invalid category' do
  product = Product.new(
    name: 'Latte Machiatto',
    price: 2.99,
    description: 'Classic Italian coffee',
    benefits: 'Boosts energy',
    category: 'Smoothie'
  )
  expect(product).not_to be_valid
end

it 'is valid with Coffee category' do
  product = Product.new(
    name: 'Latte Machiatto',
    price: 2.99,
    description: 'Classic Italian coffee',
    benefits: 'Boosts energy',
    category: 'Coffee'
  )
  expect(product).to be_valid
end

it 'is valid with HotBeverage category' do
  product = Product.new(
    name: 'Ponche de Mara',
    price: 10.00,
    description: 'Traditional warm fruit punch',
    benefits: 'Rich in Vitamin C',
    category: 'HotBeverage'
  )
  expect(product).to be_valid
end

  end
end