require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with a question" do
    contact = Contact.new(question: "What is the meaning of life?")
    expect(contact).to be_valid
  end

  it "is invalid without a question" do
    contact = Contact.new(question: nil)
    expect(contact).to_not be_valid
  end
end