require 'spec_helper'
describe SessionsController do

  # This should return the minimal set of attributes required to create a valid
  # Session. As you add validations to Session, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:email => 'test@test.site', :password => 'password' }
  end

  describe "GET new" do
    it "assigns a new session as @session" do
      get :new
      assigns(:session).should be_a(Session)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      
      before(:each) do
        @user = User.create!(valid_attributes.merge(:password_confirmation => valid_attributes[:password]))        
      end
      
      it "assigns a newly created session as @session" do
        post :create, :session => valid_attributes
        assigns(:session).should be_a(Session)
        User.current.should == @user
        session['user_id'].should == @user.id
      end

      it "redirects to the home page" do
        post :create, :session => valid_attributes
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params or no matching user" do
      it "assigns a newly created but unsaved session as @session" do
        post :create, :session => { :email => 'test@test.site'}
        assigns(:session).should be_a(Session)
        assigns(:session).email.should == 'test@test.site'
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, :session => {}
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @user = User.create!(valid_attributes.merge(:password_confirmation => valid_attributes[:password]))        
      post :create, :session => valid_attributes
    end
    
    it "signs the user out" do
      delete :destroy
      User.current.should == nil
      session['user_id'].should == nil
    end
  
    it "redirects to the new session page" do
      delete :destroy
      response.should redirect_to(new_session_url)
    end
  end

end
