class MenuItem
  include Mongoid::Document
  
  field :name, type: String
  field :url, type: String
  field :type, type: String
  
  validates_presence_of :name, :url, :type
  
end
