require "test_helper"
class PostsControllerTest < ActionController::TestCase

	def sign_in(user)
		session[:user_id] = users(user).id
	end

	def sign_out(user)
		session[:user_id] = nil
	end

	test "post form" do
		get :new
		assert_response :ok
		assert_template :new
	end

	test "can create post with title and link_url" do
		post :create, {
					title: posts(:reddit).title,
					link_url: posts(:reddit).link_url
		}
		assert_response :redirect
	end

	test "link_url must be correct format" do
		post :create, {
					title: posts(:reddit).title,
					link_url: posts(:reddit).link_url
		}
		assert_response :redirect
	end

end
