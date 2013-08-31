class BeentheresController < ApplicationController
  before_filter :authenticate_user!
  def create
      @instance = current_user.beentheres.find_by_restaurant_id(params[:restaurant_id])
      if @instance  
        @instance.destroy
      else
      current_user.beentheres.create(:restaurant_id => params[:restaurant_id])
        render :layout => false
    end
  end

  def destroy
  end

  
end
