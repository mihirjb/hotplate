 def load_suggestions
         @suggestions = Restaurant.find(:all, :conditions => ['restname LIKE ?', "%#{params[:searchquery]}%"], :order => "RANDOM()")
    render json: @suggestions
end