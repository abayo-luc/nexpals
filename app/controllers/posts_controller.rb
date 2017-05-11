class PostsController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 3).order(created_at: "DESC")
  end

  def show
    find_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Posted Created"
      redirect_to @post
    else 
      render 'new'
    end
  end

  def edit
    find_post
  end

  def update
    find_post
    if @post.update(post_params)
      flash[:success] = "Post Edited"
      redirect_to @post
    else 
      render 'edit'
    end 
  end

  def destroy
    find_post
    @post.destroy
    flash[:warning] = "Post Deleted"
    redirect_to posts_path
  end

  private
    def find_post
      @post = Post.find_by(id: params[:id])       
    end

    def post_params
      params.require(:post).permit(:title, :body, :intro)      
    end 
     
    def check_for_cancel
      if params[:commit] = 'cancel'
        redirect_back_or_default
      end
      
    end
end
