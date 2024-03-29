class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :description, type: String
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_and_belongs_to_many :categories
  
  validates_presence_of :name, :description, :user
  
end
