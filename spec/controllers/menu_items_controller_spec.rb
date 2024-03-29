require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MenuItemsController do

  # This should return the minimal set of attributes required to create a valid
  # MenuItem. As you add validations to MenuItem, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    menu_item = build(:menu_item)
    {name: "hello", url: "fawe", type: "top"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MenuItemsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all menu_items as @menu_items" do
      menu_item = MenuItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:menu_items).should eq([menu_item])
    end
  end

  describe "GET show" do
    it "assigns the requested menu_item as @menu_item" do
      menu_item = MenuItem.create! valid_attributes
      get :show, {:id => menu_item.to_param}, valid_session
      assigns(:menu_item).should eq(menu_item)
    end
  end

  describe "GET new" do
    it "assigns a new menu_item as @menu_item" do
      get :new, {}, valid_session
      assigns(:menu_item).should be_a_new(MenuItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested menu_item as @menu_item" do
      menu_item = MenuItem.create! valid_attributes
      get :edit, {:id => menu_item.to_param}, valid_session
      assigns(:menu_item).should eq(menu_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MenuItem" do
        expect {
          post :create, {:menu_item => valid_attributes}, valid_session
        }.to change(MenuItem, :count).by(1)
      end

      it "assigns a newly created menu_item as @menu_item" do
        post :create, {:menu_item => valid_attributes}, valid_session
        assigns(:menu_item).should be_a(MenuItem)
        assigns(:menu_item).should be_persisted
      end

      it "redirects to the created menu_item" do
        post :create, {:menu_item => valid_attributes}, valid_session
        response.should redirect_to(MenuItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved menu_item as @menu_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        MenuItem.any_instance.stub(:save).and_return(false)
        post :create, {:menu_item => {}}, valid_session
        assigns(:menu_item).should be_a_new(MenuItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MenuItem.any_instance.stub(:save).and_return(false)
        post :create, {:menu_item => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested menu_item" do
        menu_item = MenuItem.create! valid_attributes
        # Assuming there are no other menu_items in the database, this
        # specifies that the MenuItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MenuItem.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => menu_item.to_param, :menu_item => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested menu_item as @menu_item" do
        menu_item = MenuItem.create! valid_attributes
        put :update, {:id => menu_item.to_param, :menu_item => valid_attributes}, valid_session
        assigns(:menu_item).should eq(menu_item)
      end

      it "redirects to the menu_item" do
        menu_item = MenuItem.create! valid_attributes
        put :update, {:id => menu_item.to_param, :menu_item => valid_attributes}, valid_session
        response.should redirect_to(menu_item)
      end
    end

    describe "with invalid params" do
      it "assigns the menu_item as @menu_item" do
        menu_item = MenuItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MenuItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => menu_item.to_param, :menu_item => {}}, valid_session
        assigns(:menu_item).should eq(menu_item)
      end

      it "re-renders the 'edit' template" do
        menu_item = MenuItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MenuItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => menu_item.to_param, :menu_item => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested menu_item" do
      menu_item = MenuItem.create! valid_attributes
      expect {
        delete :destroy, {:id => menu_item.to_param}, valid_session
      }.to change(MenuItem, :count).by(-1)
    end

    it "redirects to the menu_items list" do
      menu_item = MenuItem.create! valid_attributes
      delete :destroy, {:id => menu_item.to_param}, valid_session
      response.should redirect_to(menu_items_url)
    end
  end

end
