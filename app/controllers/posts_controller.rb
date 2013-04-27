class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	Post.create params[:post]
  	redirect_to root_path, :notice => 'A new post has been created.'
  end

  def edit
  	@post = Post.find params[:id]
  end

  def update
  	post = Post.find params[:id]
  	if post.update_attributes params[:post]
  		redirect_to root_path, :notice => 'The post was succesfully updated.'
  	else
  		redirect_to :back, :notice => 'There was an error updating the post.'
  	end
  end

  def destroy
  	Post.destroy params[:id]
  	redirect_to :back, :notice => 'The post has been deleted.'
  end
end
