class User 
  include MongoMapper::Document
  
  many :posts
  many :articles
  
  key :name, String, :required => true
  key :email, String, :required => true, :unique => true
  key :password, String, :required => true
  key :admin, Boolean, :default => false
  timestamps!
  
  def authenticate(password_attempt)
    if self.password == password_attempt
      true
    else
      false
    end
  end
  
  def posts
    Post.where(:user_id => self.id)
  end
  
  def articles
    Article.where(:user_id => self.id)
  end
  
end
