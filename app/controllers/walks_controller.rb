class WalksController < ApplicationController
  def index
    @walk = Walk.all
  end
  
  def show 
    @walk = Walk.find(params[:id])
  end
  
  def new 
    @walk = Walk.new
  end
  
  def create
     @walk = Walk.new(walk_params)
    if @walk.save
      #do something
      #flash[:success] = "Your account has been created successfully!"
      redirect_to walk_path(@walk)
    else
      render 'new'
    end
  end
  
  def edit
    @walk = Walk.find(params[:id])
  end
  
  def update
    @walk = Walk.find(params[:id])
    
    if @walk.update(walk_params)
      #do
      #flash[:success] = "Your profile has been updated successfully!"
      redirect_to walk_path(@walk) 
    else
      render 'edit'
    end
  end
  
  def destory
    @walk = Walk.find(params[:id])
    
    @walk.destory
    redirect_to walk_path
  end
  
  private 
    def walk_params
      params.require(:walk).permit(:name,:date,:location, :goal)
    end
end