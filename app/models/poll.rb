class Poll
  include MongoMapper::Document

  timestamps!
  
  belongs_to :user
  key :user_id, ObjectId, :required => true
  
  many :votes

  key :name, String
  key :description, String

end

class Vote
  include MongoMapper::EmbeddedDocument
  
  timestamps!
  
  belongs_to :user
  key :user_id, ObjectId, :required => true
  
  key :value, String
end