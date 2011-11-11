class CommentsController < ApplicationController
  
  def create
	@post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment], params[:created_at])
	@comment.user_id = current_user.id
	@comment_time = @comment.created_at
 
    if @comment.save
      flash[:notice] = 'Din kommentar ar sparad!'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Nagot gick fel nar din kommentar skulle sparas: #{@comment.errors}"
      redirect_to(@comment.post)
    end
  end
 
  def destroy
    @comment = current_user.comments.find(params[:comment])
    @comment.destroy
 
    redirect_to(@comment.post)
  end
end
