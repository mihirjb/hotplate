require 'spec_helper'

describe PagesController do

  describe "GET 'thankyou'" do
    it "returns http success" do
      get 'thankyou'
      response.should be_success
    end
  end

end
