require 'spec_helper'

describe "punescrapurls/new" do
  before(:each) do
    assign(:punescrapurl, stub_model(Punescrapurl,
      :tkurl => "MyString",
      :zurl => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new punescrapurl form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", punescrapurls_path, "post" do
      assert_select "input#punescrapurl_tkurl[name=?]", "punescrapurl[tkurl]"
      assert_select "input#punescrapurl_zurl[name=?]", "punescrapurl[zurl]"
      assert_select "input#punescrapurl_status[name=?]", "punescrapurl[status]"
    end
  end
end
