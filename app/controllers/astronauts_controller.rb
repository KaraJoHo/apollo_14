class AstronautsController < ApplicationController 
  def index
    @astronauts = Astronaut.all
  end

  def show 
    @astronaut = Astronaut.find(params[:astronaut_id])
  end

end