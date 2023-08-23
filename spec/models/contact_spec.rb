require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is invalid without a question" do
    contact = Contact.new(question: nil)
    expect(contact).to_not be_valid
  end
end