class RepliesController < ApplicationController
  def new
    
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      flash[:success] = "Reply Posted"
    end
  end

  def destroy
    if @reply.destroy
      flash[:warning] = "Reply Deleted"
    end
  end

  private
    def find_reply
      @reply = Reply.find_by(id: params[:id])       
    end

    def reply_params
      params.require(:post).permit(:name, :email, :body, :comment_id)      
    end 
end
