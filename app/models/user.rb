class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :admin, type: Boolean, default: false
  
  has_many :posts
  has_many :photos
  has_many :articles
  
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  
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
