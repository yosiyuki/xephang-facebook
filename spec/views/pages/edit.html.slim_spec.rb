require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :uid => "MyString",
      :url => "MyString",
      :name => "MyString",
      :json => "MyText"
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", page_path(@page), "post" do
      assert_select "input#page_uid[name=?]", "page[uid]"
      assert_select "input#page_url[name=?]", "page[url]"
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "textarea#page_json[name=?]", "page[json]"
    end
  end
end
