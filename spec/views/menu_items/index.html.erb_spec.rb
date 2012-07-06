require 'spec_helper'

describe "menu_items/index" do
  before(:each) do
    assign(:menu_items, [
      stub_model(MenuItem,
        :name => "Name",
        :url => "Url",
        :type => "Type"
      ),
      stub_model(MenuItem,
        :name => "Name",
        :url => "Url",
        :type => "Type"
      )
    ])
  end

  it "renders a list of menu_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
