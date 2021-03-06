class StepsController < ApplicationController
  def index
  end
  
  def edit
    @post = Post.find_by_id( params[:post_id])
    @step = @post.get_step( params[:step_order] )
  end
  
  def update
    @step = Step.find_by_id( params[:step_id])
    @step.update_attributes( params[:step])
    @step.save
  end
end
