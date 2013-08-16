require 'spec_helper'

describe "mumscrapurls/index" do
  before(:each) do
    assign(:mumscrapurls, [
      stub_model(Mumscrapurl,
        :tkurl => "Tkurl",
        :zurl => "Zurl",
        :status => "Status"
      ),
      stub_model(Mumscrapurl,
        :tkurl => "Tkurl",
        :zurl => "Zurl",
        :status => "Status"
      )
    ])
  end

  it "renders a list of mumscrapurls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tkurl".to_s, :count => 2
    assert_select "tr>td", :text => "Zurl".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
