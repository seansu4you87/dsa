class Article
  include MongoMapper::Document
  
  timestamps!
  
  belongs_to :user
  key :user_id, ObjectId, :required => true
  
  many :categories, :in => :category_ids
  key :category_ids, Array
  
  key :title, String, :required => true
  key :body, String, :required => true
  key :private, Boolean
  key :published, Boolean
  key :homepage, Boolean, :default => false
  
end
