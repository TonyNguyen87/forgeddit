class CommentsController < ApplicationController
  before_action :authenticate!

  def create
    @post = Post.find(params["id"])
    @post.comments.create(body: params["body"],
                          user_id: current_user.id)
    redirect_to posts_show_path(@post)
  end

  def update
    @post = Post.find(params["id"])
    comment = Comment.find(params["comment_id"])
    comment.update(body: params["body"])
    redirect_to posts_show_path(@post.id)
  end

  def edit
    @post = Post.find(params["id"])
    @comment = Comment.find(params["comment_id"])
    render :edit # fill in the html in app/views/comments/edit.html.erb
  end

  def destroy
    @post = Post.find(params["id"])
    comment = Comment.find(params["comment_id"])
    if current_user.id == comment.user_id
      comment.destroy
    else
      flash[:notice] = "You don't have permission to delete this, asshole."
    end
    redirect_to posts_show_path(@post)
  end
end