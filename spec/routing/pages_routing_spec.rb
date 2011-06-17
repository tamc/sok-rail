require "spec_helper"

describe PagesController do
  describe "routing" do
    
    it "has a shortcut that routes just an id to pages show" do
      get("/4dfbc6b2b172c0305d00001d").should route_to("pages#show", :id => "4dfbc6b2b172c0305d00001d")
      page_path(:id => '4dfbc6b2b172c0305d00001d').should == "/4dfbc6b2b172c0305d00001d"
    end
    
    it "routes to #index" do
      get("/pages").should route_to("pages#index")
    end

    it "routes to #new" do
      get("/pages/new").should route_to("pages#new")
    end

    it "routes to #show" do
      get("/pages/1").should route_to("pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pages/1/edit").should route_to("pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pages").should route_to("pages#create")
    end

    it "routes to #update" do
      put("/pages/1").should route_to("pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pages/1").should route_to("pages#destroy", :id => "1")
    end

  end
end
