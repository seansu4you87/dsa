class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  
  has_and_belongs_to_many :photos
  has_and_belongs_to_many :articles
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.categories_from_string category_string
    category_names = category_string.gsub(/\s+/, '').split(',')
    categories = []
    
    category_names.each do |name|
      category = Category.where(name: name).first
      if category == nil
        category = Category.new
        category.name = name
        category.save
      end
      categories |= [category]
    end
    categories
  end

=begin
  def photos
    Photo.where( {category_ids: self.id} ).to_a
  end
  
  def articles
    Article.where( {category_ids: self.id} ).to_a
  end
=end
  
end
