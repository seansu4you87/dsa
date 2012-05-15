class Article 
  include MongoMapper::Document
  
  key :title, String
  key :body, String #html body
  key :private, Boolean
  key :published, Boolean
  key :homepage, Boolean, :default => false
  
  timestamps!
  
end
