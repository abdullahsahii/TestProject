require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #new' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
        get :new
      end

      it 'returns a successful response' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'assigns a new contact' do
        expect(assigns(:contact)).to be_a_new(Contact)
      end
    end

    context 'when user is not authenticated' do
      before { get :new }

      it 'redirects to sign in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }

      before { sign_in user }

      context 'with valid parameters' do
        let(:valid_params) { { contact: FactoryBot.attributes_for(:contact) } }

        it 'creates a new contact' do
          expect {
            post :create, params: valid_params
          }.to change(Contact, :count).by(1)
        end

        it 'redirects to root_path' do
          post :create, params: valid_params
          expect(response).to redirect_to(root_path)
        end
      end

      context 'with invalid parameters' do
        let(:invalid_params) { { contact: { question: '' } } }

        it 'does not create a new contact' do
          expect {
            post :create, params: invalid_params
          }.not_to change(Contact, :count)
        end

        it 'renders the new template with unprocessable_entity status' do
          post :create, params: invalid_params
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response).to render_template(:new)
        end
      end
    end

    context 'when user is not authenticated' do
      let(:valid_params) { { contact: FactoryBot.attributes_for(:contact) } }

      it 'does not create a new contact' do
        expect {
          post :create, params: valid_params
        }.not_to change(Contact, :count)
      end

      it 'redirects to sign in page' do
        post :create, params: valid_params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
