require "test_helper"
require "pry"

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
					comment_id: comments(:reddit).id,
					body: "goodbye"
					}
	assert_redirected_to posts_show_path
	end

	test "authorized user can delete comment" do
	sign_in(:tony)
	delete :destroy, { id: posts(:reddit).id,
					   comment_id: comments(:reddit).id
					}
	# assigns(:post)
	assert_redirected_to posts_show_path(posts(:reddit))
	end
end