require 'spec_helper'

describe "punescrapurls/index" do
  before(:each) do
    assign(:punescrapurls, [
      stub_model(Punescrapurl,
        :tkurl => "Tkurl",
        :zurl => "Zurl",
        :status => "Status"
      ),
      stub_model(Punescrapurl,
        :tkurl => "Tkurl",
        :zurl => "Zurl",
        :status => "Status"
      )
    ])
  end

  it "renders a list of punescrapurls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tkurl".to_s, :count => 2
    assert_select "tr>td", :text => "Zurl".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
