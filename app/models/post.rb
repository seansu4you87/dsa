class Post 
  include MongoMapper::Document
  
  belongs_to :user
  key :user_id, ObjectId, :required => true
  
  key :title, String, :required => true
  key :content, String
  
end
