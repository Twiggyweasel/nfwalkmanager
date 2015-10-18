class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
  end
  def new
    @team = Team.new 
    @walk = Walk.find(params[:walk])
  end
  
  def create 
    @team = Team.new(team_params)    
    if @team.save
      redirect_to walk_path(@team.walk)
    else
    render :new
    end
  end
  
  def edit
    @team = Team.find(params[:id])
    @walk = @team.walk
  end
  
  def update
    @team = Team.find(params[:id])
    
    if @team.update(team_params)
      redirect_to walk_path(@team.walk)
    else
      render :edit
    end
  end
  
  def destroy
    @team = Team.find(params[id])
    @walk = @team.walk
    
    @team.destroy
    redirect_to walk_path(@walk)
  end
  
  private 
    def team_params
      params.require(:team).permit(:name,:walk_id)
    end
end