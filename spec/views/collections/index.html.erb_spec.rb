require 'spec_helper'

describe "collections/index" do
  before(:each) do
    assign(:collections, [
      stub_model(Collection,
        :user_id => 1,
        :portfolio_id => 2,
        :name => "Name"
      ),
      stub_model(Collection,
        :user_id => 1,
        :portfolio_id => 2,
        :name => "Name"
      )
    ])
  end

  it "renders a list of collections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
