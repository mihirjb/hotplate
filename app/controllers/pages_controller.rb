class PagesController < ApplicationController
  
    layout "home", :only => ["home"]
  
    before_filter :authenticate_user!, :except => ["home", "searchresults"]
    
    def home
      @restaurant = Restaurant.all 
      
    end
    
    def searchresults
      @user = User.find(14)
    @restaurants =  Restaurant.near([@user.latitude, @user.longitude], 1, :units => :km)
    # @restaurants = Restaurant.all
       @json = @restaurants.to_gmaps4rails do |restaurant, marker|
        marker.infowindow render_to_string(:partial => "/restaurants/infowindow", :locals => { :restaurant => restaurant})
          marker.title "#{restaurant.restname}"
          marker.json({ :deliveryminimum => restaurant.restdelmin})
        end
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
    UserMailer.order_confirmation(@user,@orderdetails,@orderitems,@restaurqntdetails).deliver
     AdminMailer.order_confirmation(@user,@orderdetails,@orderitems,@restaurantdetails).deliver
      RestaurantMailer.order_confirmation(@user,@orderdetails,@orderitems,@restaurantdetails).deliver
  end
  
  def userorderdetails
    @user = current_user
    @orderdetails = Order.find_by_user_id(current_user.id, :order =>'created_at DESC')
   @orderitems = Orderitem.find_all_by_order_id(@orderdetails.id)
    @restaurantdetails = Restaurant.find(@orderdetails.restaurant_id)
   UserMailer.order_confirmation(@user,@orderdetails,@orderitems,@restaurantdetails).deliver
    AdminMailer.order_confirmation(@user,@orderdetails,@orderitems,@restaurantdetails).deliver
    RestaurantMailer.order_confirmation(@user,@orderdetails,@orderitems,@restaurantdetails).deliver
    # client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

        /# Create and send an SMS message
          client.account.sms.messages.create(
            from: TWILIO_CONFIG['from'],
            to: "+91#{@user.userphonenumber.to_i}",
            body: "Thanks for Ordering. Your order total is #{@orderdetails.total}. Please pay on delivery."
          ) #/
        
    
  end
  
  
  def transactionhistory
  @userorders = Order.find_all_by_user_id(current_user.id)
  end
  

 
  
end
