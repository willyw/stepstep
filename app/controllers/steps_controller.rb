class StepsController < ApplicationController
  def index
  end
  
  def new
    @step = Step.new
  end
end
