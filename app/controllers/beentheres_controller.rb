class BeentheresController < ApplicationController
  before_filter :authenticate_user!
  def create
    @instance = current_user
     @alreadypresent = Beenthere.find_by_restaurant_id("#{params[:restaurant_id]}",:conditions => ['restaurant_id LIKE ? AND user_id LIKE ?', "#{params[:restaurant_id]}", "#{@instance.id}"])
     if @alreadypresent
        @alreadypresent.destroy
    else
    Beenthere.create(:restaurant_id => params[:restaurant_id], :user_id => @instance.id)
    render :layout => false
  end
  end

  def destroy
  end

  
end
