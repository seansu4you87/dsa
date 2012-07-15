class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :body, type: String
  field :private, type: Boolean
  field :published, type: Boolean
  field :homepage, type: Boolean, default: false
  
  after_save :validate_homepage
  
  belongs_to :user
  has_and_belongs_to_many :categories
  
  validates_presence_of :title, :body, :user
  
  def validate_homepage
    if self.homepage == true
      Article.all.to_a.each do |a|
        if self != a
          a.homepage = false
          a.save!
        end
      end
    end
  end
  
  def self.homepage_article
    Article.all.to_a.each do |a|
      if a.homepage
        return a
      end
    end
    return nil
  end
  
end
