class JampotentialusersController < ApplicationController
  def create
  if  params[:jampotentialusers][:email] == "Enter you email" 
    redirect_to :back, :notice => "Try entering a valid email. Dont simply press the button"
   
     
   else
     
        @user  = Jampotentialuser.create(:email =>params[:jampotentialusers][:email])
        if @user
          redirect_to :back, :notice => "Your request has been successfully sent. Thank you."
        end
     
     end     
   end
end
