require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a gang exists" do
  Gang.all.destroy!
  request(resource(:gangs), :method => "POST", 
    :params => { :gang => { :id => nil }})
end

describe "resource(:gangs)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:gangs))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of gangs" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a gang exists" do
    before(:each) do
      @response = request(resource(:gangs))
    end
    
    it "has a list of gangs" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Gang.all.destroy!
      @response = request(resource(:gangs), :method => "POST", 
        :params => { :gang => { :id => nil }})
    end
    
    it "redirects to resource(:gangs)" do
      @response.should redirect_to(resource(Gang.first), :message => {:notice => "gang was successfully created"})
    end
    
  end
end

describe "resource(@gang)" do 
  describe "a successful DELETE", :given => "a gang exists" do
     before(:each) do
       @response = request(resource(Gang.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:gangs))
     end

   end
end

describe "resource(:gangs, :new)" do
  before(:each) do
    @response = request(resource(:gangs, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@gang, :edit)", :given => "a gang exists" do
  before(:each) do
    @response = request(resource(Gang.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@gang)", :given => "a gang exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Gang.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @gang = Gang.first
      @response = request(resource(@gang), :method => "PUT", 
        :params => { :gang => {:id => @gang.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@gang))
    end
  end
  
end

