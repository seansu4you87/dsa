require 'spec_helper'

describe Category do
  
  before(:each) do
  end
  
  after(:each) do
  end
  
  before { @category = build(:category) }
  
  subject { @category }
  
  it { should respond_to(:name) }
  
  it "saves when there is a name" do 
    @category.save.should == true
  end
  
  it "doesn't save when there is no name" do
    @category.name = nil
    @category.save.should == false
  end
  
  it "doesn't save when a category with that name already exists" do
    @category.save!
    cat2 = build(:category)
    cat2.save.should == false
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
  
  describe '#photos' do
    it 'returns an array of photos associated with the category' do
      photo1 = build(:photo)
      photo1.categories << @category
      photo1.save!
      
      @category.photos.count.should == 1
      
      photo2 = build(:photo)
      photo2.categories << @category
      photo2.save!
      
      @category.photos.count.should == 2
      
      photo3 = build(:photo)
      photo3.save!
      
      @category.photos.count.should == 2
    end
  end
  
  describe '#articles' do
    it 'returns an array of articles associated with the category' do
      a1 = build(:article)
      a1.categories << @category
      a1.save!
      
      @category.articles.count.should == 1
      
      a2 = build(:article)
      a2.categories << @category
      a2.save!
      
      @category.articles.count.should == 2
      
      a3 = build(:article)
      a3.save!
      
      @category.articles.count.should == 2
    end
  end
  
end