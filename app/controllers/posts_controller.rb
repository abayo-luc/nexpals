class PostsController < ApplicationController
   # impressionist actions: [:show], unique: [:session_hash]
   
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 2).order(created_at: "DESC")
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 2).order(created_at: "DESC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.js
     end
  end

  def show
    find_post
    @comment = Comment.new
    @reply = Reply.new
    @posts = Post.all
    @comments = @post.comments.paginate(:page => params[:page], :per_page => 6).order(created_at: "DESC")
    # impressionist(@post)
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
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :intro, :all_tags)      
    end 
     
    def check_for_cancel
      if params[:commit] = 'cancel'
        redirect_back_or_default
      end
      
    end
end
