class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  
  has_one :cart, dependent: :destroy

  has_many :orders, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true,
                            format: {  with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/ }
  validates :password, length: { minimum: 8 }, allow_nil: true
end