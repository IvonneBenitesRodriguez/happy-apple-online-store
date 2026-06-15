# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  before_validation :normalize_shipping_address

  validates :shipping_address, presence: true
  validates :phone, presence: true
  validates :payment_method, presence: true, inclusion: { in: %w[credit_card paypal] }
  validates :total, presence: true, numericality: { greater_than: 0 }

  private

  def normalize_shipping_address
    return if shipping_address.blank?

    self.shipping_address = shipping_address.strip.gsub(/\s*\n\s*/, ", ")
  end
end