class PostsController < ApplicationController
  def newpost
    @post = Post.new
  end
  def create
  	@post = Post.new(post_params)
	if @post.save
		redirect_to "/"
	else
		render "posts/newpost"
	end
  end
  def update
  end

  def delete
  end


  private
  def post_params
  	params.require(:post).permit(:content)
  end
end
