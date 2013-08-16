class ReviewsController < ApplicationController
  
  before_filter :authenticate_user!, :except => ['index','new']
  
  def index
  end

  def new
   @restaurant = Restaurant.find(params[:id])
    @review  = @restaurant.reviews.new(params[:reviews], :author => "#{@current_user.userfullname}", :user_id => "#{@current_user.id}" ) 
    
  end

  def create
    @user = current_user
     @restaurant = Restaurant.find(params[:restaurant_id])
     params[:reviews] = params[:reviews].merge({:author => @user.userfullname, :user_id => @user.id})
      @review  = @restaurant.reviews.new(params[:reviews])
      if @review.save
      redirect_to "/restaurants/#{params[:restaurant_id]}", :notice => "Review Successfully added"
    else
      redirect_to  "/restaurants/#{params[:restaurant_id]}", :notice => "Review couldnt be added"
      end
  end
  
end
