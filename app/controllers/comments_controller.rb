class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment Posted"
      render :new
    end
  end

  def destroy
    if @comment.destroy
      flash[:warning] = "comment Deleted"
      render :new
    end
  end
   private
    def find_comment
      @comment = Comment.find_by(id: params[:id])       
    end

    def comment_params
      params.require(:comment).permit(:name, :email, :web, :body, :post_id)    
    end 
end
