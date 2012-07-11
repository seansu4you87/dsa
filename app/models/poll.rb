class Poll
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :option, type: Array
  
  belongs_to :user
  embeds_many :votes
  
  validates_presence_of :name, :user

end

class Vote
  include Mongoid::Document
  
  field :value, type: String
  
  embedded_in :user
  
  validates_presence_of :user, :value
end