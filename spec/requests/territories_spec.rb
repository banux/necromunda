require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a territory exists" do
  Territory.all.destroy!
  request(resource(:territories), :method => "POST", 
    :params => { :territory => { :id => nil }})
end

describe "resource(:territories)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:territories))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of territories" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a territory exists" do
    before(:each) do
      @response = request(resource(:territories))
    end
    
    it "has a list of territories" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Territory.all.destroy!
      @response = request(resource(:territories), :method => "POST", 
        :params => { :territory => { :id => nil }})
    end
    
    it "redirects to resource(:territories)" do
      @response.should redirect_to(resource(Territory.first), :message => {:notice => "territory was successfully created"})
    end
    
  end
end

describe "resource(@territory)" do 
  describe "a successful DELETE", :given => "a territory exists" do
     before(:each) do
       @response = request(resource(Territory.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:territories))
     end

   end
end

describe "resource(:territories, :new)" do
  before(:each) do
    @response = request(resource(:territories, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@territory, :edit)", :given => "a territory exists" do
  before(:each) do
    @response = request(resource(Territory.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@territory)", :given => "a territory exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Territory.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @territory = Territory.first
      @response = request(resource(@territory), :method => "PUT", 
        :params => { :territory => {:id => @territory.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@territory))
    end
  end
  
end

