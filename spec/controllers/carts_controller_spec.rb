require 'spec_helper'
require 'rails_helper'

RSpec.describe CartsController, type: :controller do

context "when user logged in" do

  let(:user) { FactoryGirl.create(:user)}

    before do
      sign_in user
    end

  describe "Post #create" do
    it "should create cart" do
      assert_difference('Cart.count') do
        post :create, cart: { }
      end
     assert_redirected_to carts_path
     end
  end

  describe "Post #update" do
    before(:each) { @cart = FactoryGirl.create :cart}
    it "Post 'update' cart" do
      put :update, id: @cart, cart: { }
      assert_redirected_to cart_path(assigns(:cart))
    end
  end
end
end