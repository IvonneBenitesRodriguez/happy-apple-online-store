# spec/requests/dashboard_spec.rb
require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  let(:user) do
    User.create!(email_address: "ivonne@example.com", password: "password123")
  end

  before do
    post session_path, params: { email_address: user.email_address, password: "password123" }
  end

  it "saluda al usuario por su nombre" do
    get dashboard_index_path
    expect(response.body).to include("Welcome to Happy Apple, dear ivonne")
  end

  it "muestra el CTA hacia productos" do
    get dashboard_index_path
    expect(response.body).to include("What's your order today?")
    expect(response.body).to match(%r{href="/products"})
  end

  it "muestra la frase del día" do
    get dashboard_index_path
    expect(response.body).to match(/class="daily-thought"/)
  end
end