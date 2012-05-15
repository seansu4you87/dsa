class Post 
  include MongoMapper::Document
  #belongs_to :user
  
  #validates :content, :length => {:minimum => 1}
  #validates :title, :length => {:minimum => 1}
  
  belongs_to :user
  
  key :title, String, :required => true
  key :content, String
  timestamps!
  
  validate :minimum_title_length
  
  def minimum_title_length
    if title.length < 1
      errors.add( :title, 'title must be at least 1 character long' )
    end
  end
  
end
