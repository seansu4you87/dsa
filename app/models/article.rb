class Article 
  include MongoMapper::Document
  
  key :title, String
  key :description, String
  key :private, Boolean
  key :published, Boolean
  timestamps!
  
end
