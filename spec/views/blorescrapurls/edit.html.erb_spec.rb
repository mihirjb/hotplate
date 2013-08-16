require 'spec_helper'

describe "blorescrapurls/edit" do
  before(:each) do
    @blorescrapurl = assign(:blorescrapurl, stub_model(Blorescrapurl,
      :tkurl => "MyString",
      :zurl => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit blorescrapurl form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blorescrapurl_path(@blorescrapurl), "post" do
      assert_select "input#blorescrapurl_tkurl[name=?]", "blorescrapurl[tkurl]"
      assert_select "input#blorescrapurl_zurl[name=?]", "blorescrapurl[zurl]"
      assert_select "input#blorescrapurl_status[name=?]", "blorescrapurl[status]"
    end
  end
end
