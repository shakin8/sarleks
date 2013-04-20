require 'spec_helper'

describe "collections/show" do
  before(:each) do
    @collection = assign(:collection, stub_model(Collection,
      :user_id => 1,
      :portfolio_id => 2,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Name/)
  end
end
