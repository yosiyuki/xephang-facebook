require 'spec_helper'

describe "pages/new" do
  before(:each) do
    assign(:page, stub_model(Page,
      :uid => "MyString",
      :url => "MyString",
      :name => "MyString",
      :json => "MyText"
    ).as_new_record)
  end

  it "renders new page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pages_path, "post" do
      assert_select "input#page_uid[name=?]", "page[uid]"
      assert_select "input#page_url[name=?]", "page[url]"
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "textarea#page_json[name=?]", "page[json]"
    end
  end
end
