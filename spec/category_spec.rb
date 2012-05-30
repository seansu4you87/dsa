require 'spec_helper'

describe Category do
  
  before(:each) do
    
  end
  
  after(:each) do
    MongoMapper.database.collections.each do |collection|
      collection.remove
    end
  end
  
  describe '#categories_from_string' do
    
    it 'returns an array of categories from a comma delimited list' do
      categories = Category.categories_from_string 'cat1, cat2, cat3, cat4'
      categories.count.should == 4
      categories[0].name.should == 'cat1'
      categories[1].name.should == 'cat2'
      categories[2].name.should == 'cat3'
      categories[3].name.should == 'cat4'
    end
    
    it 'returns a set of all the categories, no duplicates' do
      categories = Category.categories_from_string 'cat1, cat2, cat1'
      categories.count.should == 2
      categories[0].name.should == 'cat1'
      categories[1].name.should == 'cat2'
    end
    
  end
  
end