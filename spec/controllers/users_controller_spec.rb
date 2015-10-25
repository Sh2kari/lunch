require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'when user not logged in' do
    describe 'GET #index' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context 'when user logged in' do
    let(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:menu) }

    before do
      sign_in user
    end

    describe 'GET #index' do
      it 'renders the :index view' do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
