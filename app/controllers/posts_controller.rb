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
    @post.user_id = current_user.id
    @post.save
    @post.create_steps( params ) 
 
    respond_to do |format|
      format.html {
        redirect_to add_details_url(@post.id, 1)
        return 
      }
    
      format.js{
        # set something here
      }
    end
  end
  
  def review
    @post = Post.find_by_id( params[:post_id])
  end
  
  def show_public
    @post = Post.find_by_permalink( params[:permalink])
    @owner = @post.user
  end
  
end
