class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 3).order(created_at: "DESC")
  end

  def show
    @post
  end

  def new
    
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      falsh[:success] = "Posted Created"
    end
  end

  def edit
    @post
  end

  def update
    @post = @post.update(post_params)
    flash[:success] = "Post Edited"
  end

  def destroy
    @post.destroy
  end

  private
    def find_post
      @post = Post.find_by(id: params[:id])       
    end

    def post_params
      params.require(:post).permit(:title, :body, :intro)      
    end  
end
