class Post < ActiveRecord::Base
  belongs_to :user
  has_many :steps


=begin
The content of params
{"commit"=>"Done", 
"step"=>{"title_1"=>"Test 123 ", "title_2"=>"Test 123 ", "title"=>"", "title_3"=>"Test 321"},
 "post"=>{"title"=>"How to kill a mocking bird"}, 
 "action"=>"create", "controller"=>"posts"}
=end
#however, the step maybe pre-existent (due to js posting)
  def create_steps( params ) 
    if params[:step] 
      params[:step].each do |key, value | 
        regex = /^title_(\d+)$/
        if key.match(regex)
          step_order= $1
          self.steps.create(:title => value, :order => step_order )
        else
          next
        end
      end
    else
      return nil
    end
  end
  
  def get_step( step_order )
    return Step.find(:first, :conditions => {
      :order => step_order.to_i,
      :post_id => self.id
    })
  end
  
  
end
