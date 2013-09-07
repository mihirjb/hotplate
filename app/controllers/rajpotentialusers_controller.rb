class RajpotentialusersController < ApplicationController
  def create
  if  params[:rajpotentialusers][:email] == "Enter you email" 
    redirect_to :back, :notice => "Try entering a valid email. Dont simply press the button"
   else
     
        @user  = Rajpotentialuser.create(:email =>params[:rajpotentialusers][:email])
        if @user
          redirect_to :back, :notice => "Your request has been successfully sent. Thank you."
        end
     
     end     
   end
end
