require 'spec_helper'

describe "blorescrapurls/new" do
  before(:each) do
    assign(:blorescrapurl, stub_model(Blorescrapurl,
      :tkurl => "MyString",
      :zurl => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new blorescrapurl form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blorescrapurls_path, "post" do
      assert_select "input#blorescrapurl_tkurl[name=?]", "blorescrapurl[tkurl]"
      assert_select "input#blorescrapurl_zurl[name=?]", "blorescrapurl[zurl]"
      assert_select "input#blorescrapurl_status[name=?]", "blorescrapurl[status]"
    end
  end
end
