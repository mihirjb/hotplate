class MenuitemsController < ApplicationController
  
  def index
    @restaurant = Restaurant.find(params[:id])
    @menuitem = @restaurant.Menuitem.all
  end
  
  def new  
     @restaurant = Restaurant.find(params[:id])
     @menuitem = @restaurant.menuitems.new(params[:menuitem])
  end
  
  def create
     @restaurant = Restaurant.find(params[:restaurant_id])
     @menuitem = @restaurant.menuitems.new(params[:menuitem])
          if @menuitem.save
      redirect_to "/restaurants/#{@menuitem.restaurant_id}", :notice => "Menu item added sucessfully."
    else
     redirect_to new_menuitem_path, :notice => "Menu item couldn't be added please try again."
    end
  end
    
  def show 
       @menu = Menuitem.find(params[:id])
  end

  def edit
    @menuitem = Menuitem.find(params[:id])
    @restaurant = Restaurant.find(@menuitem.restaurant_id)
  end

  def update
       @menuitem = Menuitem.find(params[:id])
       if @menuitem.update_attributes(params[:menuitem])
         redirect_to "/restaurants/#{@menuitem.restaurant_id}", :notice => "Restaurant updated sucessfully."
       else
         redirect_to edit_restaurant_path, :notice => "Restaurant couldn't be updated please try again."
       end
  end
  
  def destroy
    @menuitem = Menuitem.find(params[:id])
     if @menuitem.destroy
       redirect_to :back, :notice => "Menu item deleted sucessfully."
     else
       redirect_to :back, :notice => "Menu item not deleted sucessfully."
     end 
  end    
  
  
end
