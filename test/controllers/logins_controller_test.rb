require "test_helper"

class LoginsControllerTest < ActionController::TestCase
	test "login form" do
	get :new
	assert_response :ok
	assert_template :new
	end

	test "logout" do
	delete :destroy
	assert_redirected_to root_path
	assert_nil session[:user]
	end

	test "can create user login with username and password" do
	post :create, { 
				username: users(:tony).username,
				password: users(:tony).password
			}
	assert session[:user_id]
	end
end