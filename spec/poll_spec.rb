require 'spec_helper'

describe Poll do
  before(:each) do 
  end
  
  after(:each) do
  end
  
  before { @poll = create(:poll) }
  subject { @poll }
  
  it { should respond_to(:user) }
  it { should respond_to(:name) }
  it { should respond_to(:votes) }
  it { should respond_to(:description) }
  
  it "saves when there is a user and name" do
    @poll.save.should == true
  end
  
  it "doesn't save when there is no user" do
    @poll.user = nil
    @poll.save.should == false
  end
  
  it "doesn't save when there is no name" do
    @poll.name = nil
    @poll.save.should == false
  end
  
end