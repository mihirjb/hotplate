class JampotentialusersController < ApplicationController
  def create
  if  !params[:jampotentialusers][:email] == "Enter you email" 
     @user  = Jampotentialuser.create(:email =>params[:jampotentialusers][:email])
     if @user
       redirect_to :back, :notice => "Your request has been successfully sent. Thank you."
     end
     
   else
     redirect_to :back, :notice => "Try entering your email. Dont simply press the button"
     
   end
     
   end
end
