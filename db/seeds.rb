Product.destroy_all

Product.create!([
  {
    name: 'Latte Machiatto',
    price: 2.00,
    description: 'Classic Italian coffee with espresso and steamed milk',
    benefits: 'Boosts energy',
    category: 'Coffee'
  },
  {
    name: 'Matcha Nomimono',
    price: 1.00,
    description: 'Traditional Japanese matcha green tea',
    benefits: 'Rich in antioxidants',
    category: 'Tea'
  },
  {
    name: 'Chai Latte',
    price: 4.00,
    description: 'Spiced Indian tea with steamed milk',
    benefits: 'Anti-inflammatory',
    category: 'Tea'
  },
  {
    name: 'Salep',
    price: 7.00,
    description: 'Traditional Turkish winter drink',
    benefits: 'Warms the body',
    category: 'HotBeverage'
  },
  {
    name: 'Ponche de Maca',
    price: 10.00,
    description: 'Traditional warm potatoe punch',
    benefits: 'Rich in Vitamin B',
    category: 'HotBeverage'
  },
  {
    name: 'American Coffee',
    price: 1.50,
    description: 'Classic black American coffee',
    benefits: 'Improves focus',
    category: 'Coffee'
  },
  {
    name: 'Egyptian Tea',
    price: 7.00,
    description: 'Special blend herbal tea',
    benefits: 'Relaxing and calming',
    category: 'Tea'
  }
])

puts "✅ #{Product.count} products created!"