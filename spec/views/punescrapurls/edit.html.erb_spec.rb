require 'spec_helper'

describe "punescrapurls/edit" do
  before(:each) do
    @punescrapurl = assign(:punescrapurl, stub_model(Punescrapurl,
      :tkurl => "MyString",
      :zurl => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit punescrapurl form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", punescrapurl_path(@punescrapurl), "post" do
      assert_select "input#punescrapurl_tkurl[name=?]", "punescrapurl[tkurl]"
      assert_select "input#punescrapurl_zurl[name=?]", "punescrapurl[zurl]"
      assert_select "input#punescrapurl_status[name=?]", "punescrapurl[status]"
    end
  end
end
