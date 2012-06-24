require 'spec_helper'

describe User do
  
  before(:each) do
  end
  
  after(:each) do
    MongoMapper.database.collections.each do |collection|
      collection.remove  
    end
  end
  
  before { @user = create(:user) }
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:admin) }
  
  describe "when email format is invalid" do
    pending __FILE__
  end
  
  describe "when email format is valid" do
    pending __FILE__
  end
  
  describe "when email address is already taken" do
    pending __FILE__
  end
  
  context 'trying to save a user' do
    
    it "shouldn't save when the name is nil" do
      user = build(:user)
      user.name = nil
      user.save.should == false
    end
    
    it "shouldn't save when the email is nil" do
      user = build(:user)
      user.email = nil
      user.save.should == false
    end
    
    it "shouldn't save when the password is nil" do
      user = build(:user)
      user.password = nil
      user.save.should == false
    end
    
    it "should default admin to false" do
      user = User.new
      user.save
      user.admin.should == false
    end
    
    it "shouldn't save a user if a user with the same email is already in the system" do
      saved = create(:user)

      user = build(:user)
      user.email = saved.email
      user.save.should == false
    end  
  end
  
  describe '#authenticate' do
    it 'returns true when the given password is correct' do
      user = create(:user)
      user.authenticate('1234').should == true
    end 
    
    it 'returns false when the given password is false' do
      user = create(:user)
      user.authenticate('laewh').should == false
    end
  end
  
  describe '#categories' do
    it "returns an empty array if the user hasn't posted under any categories" do
      user = create(:user)
      user.categories.count.should == 0
    end
    
    it "returns an array of all the categories the user has posted under" do
      user = create(:user)
      
      category1 = create(:random_category)
      category2 = create(:random_category)
      
      user.categories.count.should == 0
      
      photo1 = build(:photo, user_id: user.id)
      photo1.categories << category1
      photo1.save
      
      user.photos.count.should == 1
      photo1.categories.count.should == 1
      
      User.find(user.id).categories.count.should == 1
      
      article1 = build(:article, user_id: user.id)
      article1.categories << category2
      article1.save
      
      user.articles.count.should == 1
      article1.categories.count.should == 1
      
       User.find(user.id).categories.count.should == 2
    end
  end
end