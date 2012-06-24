class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :body, type: String
  field :private, type: Boolean
  field :published, type: Boolean
  field :homepage, type: Boolean, default: false
  
  belongs_to :user
  has_and_belongs_to_many :categories
  
  validates_presence_of :title, :body, :user
  
end
