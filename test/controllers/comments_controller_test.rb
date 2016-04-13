require "test_helper"

class CommentsControllerTest < ActionController::TestCase

	def sign_in(user)
		session[:user_id] = users(user).id
	end

	def sign_out(user)
		session[:user_id] = nil
	end

	test "should route to comment" do
	assert_routing "posts/1/show/1/edit", { 
					controller: "comments", action: "edit", id: "1", comment_id: "1"
	}
	end

	test "authorized users can create comment" do
	sign_in(:tony)
	patch :update, { id: posts(:reddit).id,
					comment_id: 42,
					body: "Hello"
	}
	assert_redirected_to posts_show_path
	end

	test "can delete comment" do
	delete :destroy
	assert_redirected_to "posts/:id/show"
	end
end