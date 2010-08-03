module StepsHelper
  
  def render_next_step(current_step)
    if not_at_final_step(current_step)
      return link_to("next_step" , add_details_url(current_step.post.id,  current_step.order + 1) )
    else
      return link_to("next_step",  post_review_url(current_step.post.id) )
    end
  end
  
  def not_at_final_step(current_step)
    current_step.order != current_step.post.steps.last.order 
  end
  
end
