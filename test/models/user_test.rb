require 'test_helper'
require 'pry'

class UserTest < ActiveSupport::TestCase
	test "user can't be saved without an email" do
		@user = User.new(password: "password")
		refute @user.valid?
		@user.email = "user@email.com"
		assert @user.valid?
	end

	# test "user password is encrypted" do
	# 	@user = User.new(email: "tony@email.com",
	# 					password: "password")
	# 	@user.save
	# 	assert_not_nil? @user.password_digest
	# 	assert_not_equal? password, @user.password_digest
	# end
end
