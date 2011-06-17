require 'spec_helper'

describe PagesController do
  
  def sign_out
    session[:user_id] = nil
  end
  
  before(:each) do 
    @user ||= User.create!(:email => 'test@test.site', :password => 'password', :password_confirmation => 'password')
    session[:user_id] = @user.id
  end
  
  # This should return the minimal set of attributes required to create a valid
  # Page. As you add validations to Page, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:title => 'home page', :content => 'hello world'}
  end
  
  describe "GET index" do
    it "doesn't work unless signed in" do
      sign_out
      get :index
      response.should redirect_to(new_session_url)
    end
    
    it "assigns all pages as @pages" do
      page = Page.create! valid_attributes
      get :index
      assigns(:pages).should eq([page])
    end
  end

  describe "GET show" do
    it "assigns the requested page as @page" do
      page = Page.create! valid_attributes
      get :show, :id => page.id.to_s
      assigns(:page).should eq(page)
    end
  end

  describe "GET new" do
    it "assigns a new page as @page" do
      get :new
      assigns(:page).should be_a_new(Page)
    end
  end

  describe "GET edit" do
    it "assigns the requested page as @page" do
      page = Page.create! valid_attributes
      get :edit, :id => page.id.to_s
      assigns(:page).should eq(page)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Page" do
        expect {
          post :create, :page => valid_attributes
        }.to change(Page, :count).by(1)
      end

      it "assigns a newly created page as @page" do
        post :create, :page => valid_attributes
        assigns(:page).should be_a(Page)
        assigns(:page).should be_persisted
      end

      it "redirects to the created page" do
        post :create, :page => valid_attributes
        response.should redirect_to(Page.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page as @page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        post :create, :page => {}
        assigns(:page).should be_a_new(Page)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        post :create, :page => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested page" do
        page = Page.create! valid_attributes
        # Assuming there are no other pages in the database, this
        # specifies that the Page created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Page.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => page.id, :page => {'these' => 'params'}
      end

      it "assigns the requested page as @page" do
        page = Page.create! valid_attributes
        put :update, :id => page.id, :page => valid_attributes
        assigns(:page).should eq(page)
      end

      it "redirects to the page" do
        page = Page.create! valid_attributes
        put :update, :id => page.id, :page => valid_attributes
        response.should redirect_to(page)
      end
    end

    describe "with invalid params" do
      it "assigns the page as @page" do
        page = Page.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        put :update, :id => page.id.to_s, :page => {}
        assigns(:page).should eq(page)
      end

      it "re-renders the 'edit' template" do
        page = Page.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        put :update, :id => page.id.to_s, :page => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested page" do
      page = Page.create! valid_attributes
      expect {
        delete :destroy, :id => page.id.to_s
      }.to change(Page, :count).by(-1)
    end

    it "redirects to the pages list" do
      page = Page.create! valid_attributes
      delete :destroy, :id => page.id.to_s
      response.should redirect_to(pages_url)
    end
  end

end
