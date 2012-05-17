class User
  include MongoMapper::Document
  
  timestamps!
  
  many :posts
  many :photos
  many :articles
  
  key :name, String, :required => true
  key :email, String, :required => true, :unique => true
  key :password, String, :required => true
  key :admin, Boolean, :default => false
  
  def authenticate(password_attempt)
    if self.password == password_attempt
      true
    else
      false
    end
  end
  
  def categories
    categories = []
    
    self.photos.each do |photo|
      photo.categories.each do |category|
        categories |= [category]
      end
    end
    
    self.articles.each do |article|
      article.categories.each do |category|
        categories |= [category]
      end
    end
    
    categories
  end
  
end
