require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid role" do
    user = User.new(role: "user", email: "test@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is invalid with an invalid role" do
    expect {
      User.new(role: "invalid_role", email: "test@example.com", password: "password")
    }.to raise_error(ArgumentError, "'invalid_role' is not a valid role")
  end

  it "has many characters" do
    association = User.reflect_on_association(:characters)
    expect(association.macro).to eq(:has_many)
  end

  it "has many user comments" do
    association = User.reflect_on_association(:user_comments)
    expect(association.macro).to eq(:has_many)
  end
end
