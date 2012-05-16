class Photo
  include MongoMapper::Document
  plugin AttachIt
  
  has_attachment :file, { 
    :storage => 'gridfs',
    #:styles => { :small => '679x516>' }
  }

  timestamps!
  
  belongs_to :user
  key :user_id, ObjectId, :required => true
  
  many :categories, :in => :category_ids
  key :category_ids, Array
  
  key :name, String, :required => true
  key :description, String, :required => true
  
end
