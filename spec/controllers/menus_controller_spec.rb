require 'spec_helper'

RSpec.describe MenusController, type: :controller do

 context "when user not logged in" do
    describe "GET #index" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user)}
    subject { FactoryGirl.create(:menu)}

    before do
      sign_in user
    end
  
  describe "GET #index" do
    
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end


  describe "GET #new" do
    it "assigns the requested menu item to new menu" do
      get :new
      expect(assigns(:menu)).to be_new_record
    end
   
    it "renders the :new view" do
      get :new 
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the request menu item to subject" do
      get :show, id: subject
      expect(assigns(:menu)).to eq(subject)
    end

    it "renders the :show view" do
      get :show, id: subject
      expect(response).to render_template :show
    end
  end
 
    describe "GET #edit" do
    it "assigns the request menu item to subject" do
      get :edit, id: subject
      expect(assigns(:menu)).to eq(subject)
    end

    it "renders the :edit view" do
      get :edit, id: subject
      expect(response).to render_template :edit
    end
  end

  describe "DELETE #destroy" do
     before(:each) { @menu = FactoryGirl.create :menu}

    it "deletes the menu_item" do
      expect{
        delete :destroy, id: @menu
      }.to change(Menu, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, id: @menu
      expect(response).to redirect_to menus_path 
    end
  end

  end

end
