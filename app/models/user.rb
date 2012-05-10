class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :posts
  
  def authenticate(password_attempt)
    true
  end
  
end
