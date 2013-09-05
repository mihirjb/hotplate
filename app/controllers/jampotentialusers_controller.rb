class JampotentialusersController < ApplicationController
  def create
     @user  = Jampotentialuser.create(:email =>params[:jampotentialusers][:email])
     if @user
       redirect_to :back, :notice => "Your request has been successfully sent. Thank you."
     end
   end
end
