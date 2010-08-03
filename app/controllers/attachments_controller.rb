class AttachmentsController < ApplicationController
  def create
    @attachment = Attachment.new(params[:attachment])
    @attachment.step_id = params[:step_id]
    @attachment.save
    
    respond_to do |f|
      f.js {
        
        
      }
      
      f.html{
        
        
      }
    end
  end
end
