require 'spec_helper'

describe "mumscrapurls/new" do
  before(:each) do
    assign(:mumscrapurl, stub_model(Mumscrapurl,
      :tkurl => "MyString",
      :zurl => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new mumscrapurl form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mumscrapurls_path, "post" do
      assert_select "input#mumscrapurl_tkurl[name=?]", "mumscrapurl[tkurl]"
      assert_select "input#mumscrapurl_zurl[name=?]", "mumscrapurl[zurl]"
      assert_select "input#mumscrapurl_status[name=?]", "mumscrapurl[status]"
    end
  end
end
