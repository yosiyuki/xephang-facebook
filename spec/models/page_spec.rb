require 'spec_helper'

describe Page do
  it "create by url" do
    page = Page.create(url: 'cocacola')
    expect(page.name).to eq("Coca-Cola")
    expect(page.uid).to eq("40796308305")
  end
end
