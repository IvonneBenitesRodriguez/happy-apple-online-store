class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :benefits, presence: true
  validates :category, presence: true, inclusion: { in: %w[Coffee Tea HotBeverage] }
end