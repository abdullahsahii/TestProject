require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    let(:character) { Character.create(name: "Test Character", status: "Alive") }

    context "with valid parameters" do
      it "creates a new comment" do
        expect {
          post :create, params: { character_id: character.id, comment: { person_name: "John", comment: "Test comment" } }
        }.to change { character.comments.count }.by(1)
      end

      it "redirects to the character page" do
        post :create, params: { character_id: character.id, comment: { person_name: "John", comment: "Test comment" } }
        expect(response).to redirect_to(character_path(character))
      end
    end

    context "with invalid parameters" do
      it "does not create a new comment" do
        expect {
          post :create, params: { character_id: character.id, comment: { person_name: "", comment: "" } }
        }.not_to change { Comment.count }
      end

      it "renders the 'new' template" do
        post :create, params: { character_id: character.id, comment: { person_name: "", comment: "" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    let(:character) { Character.create(name: "Test Character", status: "Alive") }
    let(:comment) { character.comments.create(person_name: "John", comment: "Initial comment") }

    context "with valid parameters" do
      it "updates the comment" do
        patch :update, params: { id: comment.id, character_id: character.id, comment: { person_name: "Updated Name" } }
        comment.reload
        expect(comment.person_name).to eq("Updated Name")
      end

      it "redirects to the character page" do
        patch :update, params: { id: comment.id, character_id: character.id, comment: { person_name: "Updated Name" } }
        expect(response).to redirect_to(character_path(character))
      end
    end

    context "with invalid parameters" do
      it "does not update the comment" do
        patch :update, params: { id: comment.id, character_id: character.id, comment: { person_name: "" } }
        comment.reload
        expect(comment.person_name).not_to eq("")
      end

      it "renders the 'edit' template" do
        patch :update, params: { id: comment.id, character_id: character.id, comment: { person_name: "" } }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:character) { Character.create(name: "Test Character", status: "Alive") }
    let!(:comment) { character.comments.create(person_name: "John", comment: "Test comment") }

    it "destroys the comment" do
      expect {
        delete :destroy, params: { character_id: character.id, id: comment.id }
      }.to change { character.comments.count }.by(-1)
    end

    it "redirects to the character page" do
      delete :destroy, params: { character_id: character.id, id: comment.id }
      expect(response).to redirect_to(character_path(character))
    end
  end
end
