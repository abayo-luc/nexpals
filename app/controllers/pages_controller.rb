class PagesController < ApplicationController

  def home
    @post = Post.last
  end
  def final
    
  end
end
