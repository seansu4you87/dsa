class Article include MongoMapper::Document
  
  key :title, String
  key :description, Text
  key :private, Boolean
  key :published, Boolean
  
end
