require 'spec_helper'

describe Post do 
  before(:each) do
  end
  
  after(:each) do
  end
  
  before { @post = create(:post) }
  subject { @post }
  
  it "saves when there is a user and a title" do
    @post.save.should == true
  end
  
  it "doesn't save when there is no user" do
    @post.user = nil
    @post.save.should == false
  end
  
  it "doesn't save when there is no title" do
    @post.title = nil
    @post.save.should == false
  end
  
end