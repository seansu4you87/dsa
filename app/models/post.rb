class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String
  
  belongs_to :user
  
  validates_presence_of :title, :user
  
  #timestamps!

  #belongs_to :user
  #key :user_id, ObjectId, :required => true
  
  #key :title, String, :required => true
  #key :content, String
  
end
