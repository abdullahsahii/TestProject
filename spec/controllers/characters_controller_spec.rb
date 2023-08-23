require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  describe 'GET #index' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }
      let!(:character) { FactoryBot.create(:character, user: user) }

      before do
        sign_in user
        get :index
      end

      it 'returns a successful response' do
        expect(response).to be_successful
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'assigns characters belonging to the current user' do
        expect(assigns(:characters)).to include(character)
      end
    end
  end

  describe 'GET #show' do
    let!(:character) { FactoryBot.create(:character) }

    before { get :show, params: { id: character.id } }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns the requested character' do
      expect(assigns(:character)).to eq(character)
    end
  end

end
