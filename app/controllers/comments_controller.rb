class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
 
    if @comment.save
      flash[:notice] = 'Din kommentar ar sparad!'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Nagot gick fel nar din kommentar skulle sparas: #{@comment.errors}"
      redirect_to(@comment.post)
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to(@comment.post)
  end
end
