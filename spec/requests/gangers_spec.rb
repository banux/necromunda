require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a ganger exists" do
  Ganger.all.destroy!
  request(resource(:gangers), :method => "POST", 
    :params => { :ganger => { :id => nil }})
end

describe "resource(:gangers)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:gangers))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of gangers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a ganger exists" do
    before(:each) do
      @response = request(resource(:gangers))
    end
    
    it "has a list of gangers" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Ganger.all.destroy!
      @response = request(resource(:gangers), :method => "POST", 
        :params => { :ganger => { :id => nil }})
    end
    
    it "redirects to resource(:gangers)" do
      @response.should redirect_to(resource(Ganger.first), :message => {:notice => "ganger was successfully created"})
    end
    
  end
end

describe "resource(@ganger)" do 
  describe "a successful DELETE", :given => "a ganger exists" do
     before(:each) do
       @response = request(resource(Ganger.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:gangers))
     end

   end
end

describe "resource(:gangers, :new)" do
  before(:each) do
    @response = request(resource(:gangers, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@ganger, :edit)", :given => "a ganger exists" do
  before(:each) do
    @response = request(resource(Ganger.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@ganger)", :given => "a ganger exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Ganger.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @ganger = Ganger.first
      @response = request(resource(@ganger), :method => "PUT", 
        :params => { :ganger => {:id => @ganger.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@ganger))
    end
  end
  
end

