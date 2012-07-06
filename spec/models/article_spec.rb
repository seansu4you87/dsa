require 'spec_helper'

describe Article do
  before(:each) do
  end
  
  after(:each) do
  end
  
  before { @article = create(:article) }
  
  subject { @article }
  
  it { should respond_to(:user) }
  it { should respond_to(:categories) }
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:private) }
  it { should respond_to(:published) }
  it { should respond_to(:homepage) }
  
  it "should default homepage boolean to false" do
    @article.homepage.should == false
  end
  
  it "saves when there is a user, title, and body" do
    @article.save.should == true
  end
  
  it "doesn't save when there is no user" do
    @article.user = nil
    @article.save.should == false
  end
  
  it "doesn't save when there is no title" do
    @article.title = nil
    @article.save.should == false
  end
  
  it "doesn't save when there is no body" do
    @article.body = nil
    @article.save.should == false
  end
  
end