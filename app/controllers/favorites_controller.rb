class FavoritesController < ApplicationController
  
  def decide
    @instance = current_user.favorites.find_by_restaurant_id(params[:restaurant_id])
    if @instance  
      @instance.destroy
    else
    current_user.favorites.create(:restaurant_id => params[:restaurant_id])
      render :layout => false
  end
end
  
   
   def show 
     @fav = Favorite.find(params[:id])
   end
   
   def destroy
   end
end
