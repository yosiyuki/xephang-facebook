require 'spec_helper'

describe "pages/show" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :uid => "Uid",
      :url => "Url",
      :name => "Name",
      :json => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uid/)
    rendered.should match(/Url/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
