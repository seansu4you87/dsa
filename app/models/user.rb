class User include MongoMapper::Document
  #validates :email, presence: true, uniqueness: true
  #validates :name, presence: true
  #has_many :posts
  
  key :name, String, :required => true
  key :email, String, :required => true
  key :password_hash, String, :required => true
  
  
  def authenticate(password_attempt)
    if self.password == password_attempt
      true
    else
      false
    end
  end
  
end
