class CommentsController < ApplicationController
  def new
    
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment Posted"
    end
  end

  def destroy
    @comment.destroy
    flash[:warning] = "comment Deleted"
  end
   private
    def find_comment
      @comment = Comment.find_by(id: params[:id])       
    end

    def comment_params
      params.require(:post).permit(:name, :email, :web, :body, :post_id)      
    end 
end
