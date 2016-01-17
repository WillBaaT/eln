class FunctionsController < ApplicationController
	def home
		@post = Post.new
		@post = Post.all
	end
	def clone
		
	end
end
