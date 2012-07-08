require 'spec_helper'

describe MenuItem do
  
  before(:each) do
  end
  
  after(:each) do
  end
  
  before { @menu_item = create(:menu_item) }
  subject { @menu_item }
  
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:type) }
  
  it 'saves when there is a name, url, and type' do
    @menu_item.save.should == true
  end
  
  it "doesn't save when there is no name" do
    @menu_item.name = nil
    @menu_item.save.should == false
  end
  
  it "doesn't save when there is no url" do
    @menu_item.url = nil
    @menu_item.save.should == false
  end
  
  it "doesn't save when there is no type" do
    @menu_item.type = nil
    @menu_item.save.should == false
  end
  
end
