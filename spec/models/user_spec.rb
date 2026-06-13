require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a valid email and password" do
    user = User.new(email_address: "ivonne@test.com", password: "SecurePass123!")
    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user = User.new(email_address: nil, password: "SecurePass123!")
    expect(user).not_to be_valid
  end

  it "is not valid with a duplicated email" do
    User.create!(email_address: "ivonne@test.com", password: "SecurePass123!")
    duplicate = User.new(email_address: "IVONNE@test.com", password: "SecurePass123!")
    expect(duplicate).not_to be_valid
  end

  it "is not valid with a password shorter than 8 characters" do
    user = User.new(email_address: "ivonne@test.com", password: "short12")
    expect(user).not_to be_valid
  end

  it "is not valid with an email without the extension" do
    user = User.new(email_address: "ivonne@test", password: "SecurePass123!")
    expect(user).not_to be_valid
  end


end