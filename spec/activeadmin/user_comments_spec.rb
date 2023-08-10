require 'rails_helper'
require_relative '../support/active_admin_helper'


RSpec.describe Admin::UserComments, type: :admin do
  let(:admin_user) { create(:admin_user) } # Assuming you have an AdminUser model

  describe 'permit_params' do
    it 'permits the required attributes' do
      expect(described_class.permitted_params).to contain_exactly(:person_name, :comment, :user_id, :character_id, :rating)
    end
  end

  describe 'form' do
    it 'renders the form inputs' do
      render_active_admin_form do |f|
        expect(f).to have_selector('input[name="user_comment[person_name]"]')
        expect(f).to have_selector('textarea[name="user_comment[comment]"]')
        expect(f).to have_selector('input[name="user_comment[character_id]"]')
        expect(f).to have_selector('input[name="user_comment[user_id]"]')
        expect(f).to have_selector('input[name="user_comment[rating]"]')
      end
    end
  end

  describe 'index' do
    let!(:user_comment) { create(:user_comment) } # Assuming you have a UserComment model

    before do
      login_as(admin_user, scope: :admin_user)
      visit admin_user_comments_path
    end

    it 'displays the list of user comments' do
      expect(page).to have_content(user_comment.person_name)
      expect(page).to have_content(user_comment.comment)
      expect(page).to have_content(user_comment.character_id)
      expect(page).to have_content(user_comment.user_id)
      expect(page).to have_content(user_comment.rating)
    end

    it 'has actions links' do
      expect(page).to have_selector('.actions')
    end
  end
end
