 Happy Apple Online Store

A full-stack e-commerce application built with Ruby on Rails 8.1, demonstrating a complete purchase flow alongside a deliberate, documented approach to application security.

Live demo: https://happy-apple-online-store-production.up.railway.app

Part 1 — Functionality

Tech Stack

Backend: Ruby on Rails 8.1.3 (monolith).<br/>
Frontend: Server-rendered ERB views + Turbo/Hotwire (Rails-native, no separate JS framework).<br/>
Database: PostgreSQL.<br/>
Authentication: BCrypt (has_secure_password), Rails 8 native session-based auth.<br/>
Testing: RSpec (TDD workflow throughout).<br/>
Static analysis: Brakeman.<br/>
Deployment: Railway.<br/>

Features

User registration and login with hashed passwords.<br/>
Personalized dashboard with a rotating "thought of the day".<br/>
Product catalog with categories (coffee/tea), search, and detail view.<br/>
Shopping cart (add, update quantity, remove items).<br/>
Checkout flow with shipping address, phone, and payment method selection.<br/>
Order confirmation and persistent order history per user.<br/>

### Screnshots

#### Sign-up
![Sign-up screen](docs/screenshots/sign-up.png)<br/>

#### Login
![Login screen](docs/screenshots/login.png)<br/>

#### Dashboard
![Dashboard screen](docs/screenshots/dashboard.png)<br/>

#### Products
![Products screen](docs/screenshots/products.png)<br/>

#### Checkout-Shipping
![Checkout-Shipping screen](docs/screenshots/checkout-shipping.png)<br/>

#### Order-Confirmed
![Order-Confirmed screen](docs/screenshots/order-confirmed.png)<br/>








