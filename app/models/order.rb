class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :shipping_address, presence: true
  validates :phone, presence: true
  validates :payment_method, presence: true, inclusion: { in: %w[credit_card paypal] }
  validates :total, presence: true, numericality: { greater_than: 0 }
end