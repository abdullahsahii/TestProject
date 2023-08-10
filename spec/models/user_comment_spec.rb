require 'rails_helper'

RSpec.describe UserComment, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:character) { Character.create(name: 'Rick Sanchez', user: user) }

  it "belongs to a character" do
    user_comment = UserComment.new(character: character)
    expect(user_comment.character).to eq(character)
  end

  it "belongs to a user" do
    user_comment = UserComment.new(user: user)
    expect(user_comment.user).to eq(user)
  end

  it "is valid with required attributes" do
    user_comment = UserComment.new(character: character, user: user, comment: 'Great character!')
    expect(user_comment).to be_valid
  end

  it "is invalid without a character" do
    user_comment = UserComment.new(user: user, comment: 'Awesome!')
    expect(user_comment).to_not be_valid
    expect(user_comment.errors[:character]).to include("must exist")
  end

  it "is invalid without a user" do
    user_comment = UserComment.new(character: character, comment: 'Loved it!')
    expect(user_comment).to_not be_valid
    expect(user_comment.errors[:user]).to include("must exist")
  end

  it "is invalid without a comment" do
    user_comment = UserComment.new(character: character, user: user)
    expect(user_comment).to_not be_valid
    expect(user_comment.errors[:comment]).to include("can't be blank")
  end
end
