class CommentsController < ApplicationController

def create
  	@post = Post.find(params[:post_id])
   	@comment = @post.comments.new(params[:comment])

  	respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: 'Comment successfully posted.'}
        format.json { render json: @comment, status: :created }
      else
        format.html { redirect_to :back, notice: 'There was an error posting your comment.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
   end
end

end
