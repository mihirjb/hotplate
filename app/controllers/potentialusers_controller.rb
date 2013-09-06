class PotentialusersController < ApplicationController
  def create
    
    @user  = Potentialuser.create(:restaurant_id => params[:restaurant_id], :email => params[:potentialusers][:email])
    if @user
      redirect_to :back, :notice => "Your request has been successfully sent. Thank you."
    end
  end
end
