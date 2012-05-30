require 'spec_helper'

def default_user
  user = User.new
  user.name = 'Sean Yu'
  user.email = 'seansu4you87@gmail.com'
  user.password = 'haisean'
  user.admin = true
  user
end

describe User do
  
  before(:each) do
    
  end
  
  after(:each) do
    MongoMapper.database.collections.each do |collection|
      collection.remove  
    end
  end
  
  context 'trying to save a user' do
    
    it "shouldn't save when the name is nil" do
      user = default_user
      user.name = nil
      user.save.should == false
    end
    
    it "shouldn't save when the email is nil" do
      user = default_user
      user.email = nil
      user.save.should == false
    end
    
    it "shouldn't save when the password is nil" do
      user = default_user
      user.password = nil
      user.save.should == false
    end
    
    it "should default admin to false" do
      user = User.new
      user.save
      user.admin.should == false
    end
    
    it "shouldn't save a user if a user with the same email is already in the system" do
      saved = default_user
      saved.save

      user = User.new
      user.name = 'John'
      user.email = saved.email
      user.password = '1234'
      user.save.should == false
    end  
  end
  
  describe '#authenticate' do
    it 'returns true when the given password is correct' do
      user = default_user
      user.authenticate('haisean').should == true
    end 
    
    it 'returns false when the given password is false' do
      user = default_user
      user.authenticate('laewh').should == false
    end
  end
  
  describe '#categories' do
    it "returns an empty array if the user hasn't posted under any categories" do
      user = default_user
      user.categories.count.should == 0
    end
    
    it "returns an array of all the categories the user has posted under" do
      user = default_user
      user.save
      
      category1 = Category.new
      category1.name = 'birds'
      category1.save
      
      category2 = Category.new
      category2.name = 'dolphins'
      category2.save
      
      user.categories.count.should == 0
      
      photo1 = Photo.new
      photo1.name = 'Cardinal'
      photo1.description = 'My favorite bird'
      photo1.user = user
      photo1.categories << category1
      photo1.save
      
      user.photos.count.should == 1
      photo1.categories.count.should == 1
      
      User.find(user.id).categories.count.should == 1
      
      article1 = Article.new
      article1.title = 'Dolphins are my favorite'
      article1.body = "They're the best fish ever!"
      article1.user = user
      article1.categories << category2
      article1.save
      
      user.articles.count.should == 1
      article1.categories.count.should == 1
      
       User.find(user.id).categories.count.should == 2
    end
  end
end