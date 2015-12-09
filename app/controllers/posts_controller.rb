class PostsController < ApplicationController
	before_action :post_finder, only: [:show, :edit, :update, :destroy, :like_post, :dislike_post]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order(orderscore: :desc)
	end

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.likes = 0
		@post.dislikes = 0
		update_orderscore

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def like_post
		if !@post.likearray.include?(current_user.id)
			@post.increment!(:likes)
			@post.likearray << current_user.id
		end
		update_orderscore
		@post.save
		redirect_to @post
	end

	def dislike_post
		if !@post.dislikearray.include?(current_user.id)
			@post.increment!(:dislikes)
			@post.dislikearray << current_user.id
		end
		update_orderscore
		@post.save
		redirect_to @post
	end

	def update_orderscore
		@post.orderscore = @post.likes - (2*(@post.dislikes)) + (4*(@post.comments.count))
	end

	private

	def post_finder
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
	
end
