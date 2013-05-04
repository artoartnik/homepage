class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new params[:post]

  	if @post.save
  		redirect_to root_path, :notice => 'A new post has been created.'
  	else
  		flash[:notice] = 'There was an error creating your post.'
  		render :action => 'new', :post => @post
  	end
  end

  def edit
  	@post = Post.find params[:id]
  end

  def update
  	@post = Post.find params[:id]
  	if @post.update_attributes params[:post]
  		redirect_to root_path, :notice => 'The post was succesfully updated.'
  	else
  		flash[:notice] = 'There was an error updating the post.'
  		render :action => 'edit', :post => @post
  	end
  end

  def destroy
  	Post.destroy params[:id]
  	redirect_to :back, :notice => 'The post has been deleted.'
  end
end
