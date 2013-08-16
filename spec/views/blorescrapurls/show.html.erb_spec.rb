require 'spec_helper'

describe "blorescrapurls/show" do
  before(:each) do
    @blorescrapurl = assign(:blorescrapurl, stub_model(Blorescrapurl,
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
