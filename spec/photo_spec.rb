require 'spec_helper'

describe Photo do
  before(:each) do
    
  end
  
  after(:each) do
    MongoMapper.database.collections.each do |collection|
      collection.remove
    end
  end
  
  before { @photo = create(:photo) }
  
  subject { @photo }
  
  it { should respond_to(:user) }
  it { should respond_to(:categories) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:file) }
  
  it 'saves when there is a user, name, and description' do
    @photo.save.should == true
  end
  
  it "doesn't save when there is no user" do
    @photo.user = nil
    @photo.save.should == false
  end
  
  it "doesn't save when there is no name" do
    @photo.name = nil
    @photo.save.should == false
  end
  
  it "doesn't save when there is no description" do
    @photo.description = nil
    @photo.save.should == false
  end
  
end