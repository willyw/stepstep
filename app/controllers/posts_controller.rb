class PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end
  
  def new
    @post = Post.new
  end
  
  def create
    
    # there can be .js
    # there can be .html
    @post = Post.create(params[:post])
    @post.user_id = self.id
    @post.save
    @post.create_steps( params ) 
 
    respond_to do |format|
      format.html {
        redirect_to posts_url
        return 
      }
    
      format.js{
        # set something here
      }
    end
  end
end
