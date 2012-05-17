class Category
  include MongoMapper::Document
  
  timestamps!
  
  key :name, String, :required => true, :unique => true
  
  def self.categories_from_string category_string
    category_names = category_string.gsub(/\s+/, '').split(',')
    categories = []
    
    category_names.each do |name|
      category = Category.find_by_name name
      if category == nil
        category = Category.new
        category.name = name
      end
      categories << category
    end
    categories
  end
  
  def photos
    Photo.where( {category_ids: self.id} )
  end
  
  def articles
    Article.where( {category_ids: self.id} )
  end
  
end
