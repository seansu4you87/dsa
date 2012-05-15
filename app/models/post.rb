class Post include MongoMapper::Document
  #belongs_to :user
  
  #validates :content, :length => {:minimum => 1}
  #validates :title, :length => {:minimum => 1}
  
  key :title, String
  key :content, String
  key :user_id, Integer
  
end
