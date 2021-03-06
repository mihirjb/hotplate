class RestaurantsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => ["show"]
  
  def index
    @restaurant = Restaurant.all
  end
  
  def new 
    @restaurant = Restaurant.new(params[:restaurant])
    5.times { @restaurant.assets.build }
    
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
       @menuitem = Menuitem.find_all_by_restaurant_id(@restaurant.id)
       @uniq_itemcategories = @menuitem.uniq(&:itemcategory) 
       if request.path != restaurant_path(@restaurant)
          redirect_to @restaurant, status: :moved_permanently
        end
      
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
5.times { @restaurant.assets.build }
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
