require 'mime/types'
class DetailsController < ApplicationController
  def create
    @detail = Detail.new(params[:detail])
    @detail.step_id = params[:step_id]
    @detail.save
    
    respond_to do |f|
      f.js {
        
        
      }
      
      f.html{
        
        redirect_to :back
      }
    end
  end
  
  def update
    
  end
end
