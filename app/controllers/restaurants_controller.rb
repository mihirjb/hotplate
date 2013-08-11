class RestaurantsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => ["show"]
  
  def index
    @restaurant = Restaurant.all
  end
  
  def new 
    @restaurant = Restaurant.new(params[:restaurant])
  end
  
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      redirect_to root_path, :notice => "Restaurant added sucessfully."
    else
     redirect_to new_restaurant_path, :notice => "Restaurant couldn't be added please try again."
    end
  end
    
  def show 
       @restaurant = Restaurant.find(params[:id])
       @menuitem = Menuitem.find_all_by_restaurant_id(params[:id])
       @uniq_itemcategories = @menuitem.uniq(&:itemcategory) 
       
       
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
       @restaurant = Restaurant.find(params[:id])
       if @restaurant.update_attributes(params[:restaurant])
         redirect_to root_path, :notice => "Restaurant updated sucessfully."
       else
         redirect_to edit_restaurant_path, :notice => "Restaurant couldn't be updated please try again."
       end
  end
  
  def destroy
    @restaurant = Restaurant.find(params[:id])
     if @restaurant.destroy
       redirect_to root_path, :notice => "Restaurant deleted sucessfully."
     else
       redirect_to root_path, :notice => "Restaurant couldn't be deleted please try again."
     end 
  end    
     
     
  
end
