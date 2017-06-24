class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
   # impressionist actions: [:show], unique: [:session_hash]
   respond_to :html, :js
   
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10).order(created_at: "DESC")
      respond_to do |format|
        format.html
        format.js
      end
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 5).order(created_at: "DESC")
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def show
    find_post
    @comment = Comment.new
    @reply = Reply.new
    @posts = Post.all
    @comments = @post.comments.paginate(:page => params[:page], :per_page => 3).order(created_at: "DESC")
    # impressionist(@post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    p@post.assign_attributes(user_id: current_user.id)
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
      params.require(:post).permit(:title, :body, :intro, :all_tags, :url)      
    end 
     
    def check_for_cancel
      if params[:commit] = 'cancel'
        redirect_back_or_default
      end
      
    end
end
