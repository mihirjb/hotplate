class PagesController < ApplicationController
    before_filter :authenticate_user!, :except => ["home"]
    
    def home
      @restaurant = Restaurant.all 
       if params[:searchquery]
         if params[:searchquery].blank?
           @msg = "Either of the fields cannot be blank, please input correct values and try again"
         else
           @restaurantresults = Restaurant.find(:all, :conditions => ['restname LIKE ?', "%#{params[:searchquery]}%"], :order => "RANDOM()")
           @menuresults = Menuitem.find(:all, :conditions => ['itemname LIKE ?', "%#{params[:searchquery]}%"], :order => "RANDOM()")
         #  @restaurantresults = Restaurant.find_by_restname(params[:searchquery])
           @msg = "Showing search results for #{params[:searchquery]}"
         end
     end
      
    end
    
  def thankyou
@orderdetails = Order.find_by_user_id(current_user.id, :order =>'created_at DESC')
   @orderitems = Orderitem.find_all_by_order_id(@orderdetails.id)
    @restaurantdetails = Restaurant.find(@orderdetails.restaurant_id)
  end
  
  def userorderdetails
@orderdetails = Order.find_by_user_id(current_user.id, :order =>'created_at DESC')
   @orderitems = Orderitem.find_all_by_order_id(@orderdetails.id)
    @restaurantdetails = Restaurant.find(@orderdetails.restaurant_id)
  end
  
  
  def transactionhistory
  
  @userorders = Order.find_all_by_user_id(current_user.id)
  end
  
  
 
  
end
