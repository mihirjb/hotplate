class RestaurantMailer < ActionMailer::Base
  
  default :from => "general@5ve.in"
  
  def order_confirmation(user,orderdetails,orderitems,restaurantdetails)
    
    @user = user
    @orderdetails = orderdetails
    @orderitems = orderitems
    @restaurantdetails = restaurantdetails
       mail(:to => restaurantdetails.restemail, :subject => "Order Placed successfuly")
   end  
end
