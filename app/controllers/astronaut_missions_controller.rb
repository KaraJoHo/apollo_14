class AstronautMissionsController < ApplicationController 
  def create 
    AstronautMission.create!(astronaut_missions_params)
    redirect_to "/astronauts/#{params[:astronaut_id]}"
  end

  private 

  def astronaut_missions_params 
    params.permit(:astronaut_id, :mission_id)
  end
end