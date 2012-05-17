require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def default_user
    user = User.new
    user.name = 'Sean Yu'
    user.email = 'seansu4you87@gmail.com'
    user.password = 'haisean'
    user.admin = true
    user
  end
  
  test 'create new user' do
    user = self.default_user
    assert user.save, "was not able to create user"
  end
  
  test 'should not make new user without name' do
    user = self.default_user
    user.name = nil
    assert !user.save
  end
  
end
