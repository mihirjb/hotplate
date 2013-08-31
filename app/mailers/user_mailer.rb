class UserMailer < ActionMailer::Base
  
  default :from => "mihirjb@gmail.com"
  
  def registration_confirmation(user)
      mail(:to => user.email, :subject => "Registered")
  end
    
  def order_confirmation(user,orderdetails,orderitems,restaurantdetails)
    
    @user = user
    @orderdetails = orderdetails
    @orderitems = orderitems
    @restaurantdetails = restaurantdetails
       mail(:to => user.email, :subject => "Order Placed successfuly")
   end  
    
    
end
