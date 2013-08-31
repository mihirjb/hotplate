require 'spec_helper'

describe FavoritesController do

  describe "GET 'decide'" do
    it "returns http success" do
      get 'decide'
      response.should be_success
    end
  end

end
