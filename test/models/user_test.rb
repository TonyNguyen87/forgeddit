require 'test_helper'
require 'pry'

class UserTest < ActiveSupport::TestCase
	test "user has email and password" do
		user = User.new, {email: users(:tony).email,
							password: users(:tony).password}
							binding.pry
		assert user.valid?
	end
end
