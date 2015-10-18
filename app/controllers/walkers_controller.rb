class WalkersController < ApplicationController
  def index
    if params[:search]
      @walker = Walker.search(params[:search]).order("created_at DESC")
      @walks = Walk.order("created_at DESC")
    else
      @walker = Walker.all
      @walks = Walk.order("created_at DESC")
    end
  end

  
  def new
    @walker = Walker.new
    @walk = Walk.find(params[:walk])
  end
  
  def create
    @walker = Walker.new(walker_params)
  
    if @walker.save 
      redirect_to team_path(@walker.team)
    else
      render :new
    end
  end
  
  def edit
    @walker = Walker.find(params[:id])
    @walk = @walker.team.walk
  end
  
  def update
    @walker = Walker.find(params[:id])
    
    if @walker.update(walker_params)
      redirect_to walk_path(@walker.team.walk)
    else
      :edit
    end
  end
  
  def destroy
    @walker = Walker.find(params[:id])
    @walk = @walker.team.walk
    
    @walker.destroy
    redirect_to walk_path(@walk)
  end
  
  private 
    def walker_params
      params.require(:walker).permit(:first_name,:last_name, :type, :amount_owed, :amount_paid, :walk_up, :team_id)
    end
end