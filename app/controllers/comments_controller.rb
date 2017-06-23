class CommentsController < ApplicationController
  before_action :authenticate_admin, only: [:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      flash[:success] = "Comment Posted"
      redirect_to @comment.post
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
      params.require(:comment).permit(:name, :email, :web, :body, :post_id, :media)    
    end 
end
