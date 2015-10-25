require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
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
    let(:cart) { FactoryGirl.create(:cart) }
    let(:line_item) { FactoryGirl.create(:line_item) }
    let(:order_params) { FactoryGirl.create(:order) }
    before do
      sign_in user
    end

    describe 'GET #index' do
      it 'renders the :index view' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'Post #create' do
      @order = FactoryGirl.create :order
      it 'should create order' do
        assert_difference('Order.count') do
          post :create, order: { name: 'sasha', email: 'hhhh@kkk.com', price: '23', address: 'gfdgdfgdsdfgsdgsdfgsdgsdf' }
        end
        assert_redirected_to root_path
      end
    end
  end
end
