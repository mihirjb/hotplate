require 'spec_helper'

describe "punescrapurls/show" do
  before(:each) do
    @punescrapurl = assign(:punescrapurl, stub_model(Punescrapurl,
      :tkurl => "Tkurl",
      :zurl => "Zurl",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tkurl/)
    rendered.should match(/Zurl/)
    rendered.should match(/Status/)
  end
end
