class PagesController < ApplicationController
  
    layout "home", :only => ["home"]
  
    before_filter :authenticate_user!, :except => ["home", "searchresults"]
    
    def home
      @restaurant = Restaurant.all 
      @uniqcities = @restaurant.uniq(&:city) 
      
    end
    
    def searchresults
        if params[:searchquery]
           if params[:searchquery].blank?
             @msg = "Either of the fields cannot be blank, please input correct values and try again"
           else
             @restcity = Restaurant.find(params[:cities])
             @restaurantresults = Restaurant.find(:all, :conditions => ['restname iLIKE ? AND city iLIKE ?', "%#{params[:searchquery]}%", @restcity.city], :order => "RANDOM()")
             @menuresults = Menuitem.find(:all, :conditions => ['itemname iLIKE ?', "%#{params[:searchquery]}%"])
             @itemcategory = Menuitem.find(:all, :conditions => ['itemcategory iLIKE ?', "%#{params[:searchquery]}%"])
             @restarearesults = Restaurant.find(:all, :conditions => ['rarea iLIKE ? AND city iLIKE ?', "%#{params[:searchquery]}%", @restcity.city], :order => "RANDOM()")
           #  @restaurantresults = Restaurant.find_by_restname(params[:searchquery])
           
           
           end
       end
       respond_to do |format|
       format.html {render :layout => 'searchresults'}
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
