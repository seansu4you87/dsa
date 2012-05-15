class Article 
  include MongoMapper::Document
  
  belongs_to :user
  key :user_id, ObjectId, :required => true
  
  key :title, String
  key :body, String #html body
  key :private, Boolean
  key :published, Boolean
  key :homepage, Boolean, :default => false
  
  timestamps!
  
end
