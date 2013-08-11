class OrdersController < ApplicationController
  
  before_filter :authenticate_admin!, :except => ["create"]
  
  
  def index
  end

  def new
    @order = Order.new;
  end

  def create
    

    if user_signed_in?
      # do nothing
      @setpassword = false
      
    else
      password = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
     @user = User.create(:userfullname => params[:order][:customername],:userphonenumber => params[:order][:custoemrnumber], :useraddress => params[:order][:customeraddress], :email => params[:order][:customeremail], :password => password, :password_confirmation => password)
     @setpassword = true
     sign_in @user, :bypass => true 
     
    end
  
   
   if user_signed_in?
     params[:order] = {:customername => @current_user.userfullname,:custoemrnumber => @current_user.userphonenumber,:customeremail => @current_user.email,:customeraddress => @current_user.useraddress,:user_id => @current_user.id, :total=>params[:total],:restaurant_id => params[:restaurant_id]}
   else
    params[:order] = params[:order].merge({:total=>params[:total],:restaurant_id => params[:restaurant_id]})
    
  end
        @order = Order.new(params[:order])
    if @order.save
      @neworder = Order.last
        params[:item].each do |item|
         item = item.merge({:restaurant_id => params[:restaurant_id],:order_id=>@neworder.id})
             @orderitem = Orderitem.create(item)
            end
            if @setpassword
              redirect_to "/pages/thankyou?p=#{password}"
              
            else
              redirect_to "/pages/userorderdetails"
    end
    else
      redirect_to new_order_path
    end
      
  end  
  

def inspect
end
  
end
