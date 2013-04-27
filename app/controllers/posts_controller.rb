class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	Post.create params[:post]
  	redirect_to root_path
  end

  def edit
  	@post = Post.find params[:id]
  end

  def update
  	post = Post.find params[:id]
  	if post.update_attributes params[:post]
  		redirect_to root_path
  	end
  end
end
