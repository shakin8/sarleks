require 'spec_helper'
describe "Static pages" do
  describe "Home page" do
    it "should have the h1 'Sarleks Home'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sarleks Home')
    end
    it "should have the title 'Sarleks Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
      :text => "Sarleks | Home")
    end
  end
  describe "Help page" do
    it "should have the h1 'Sarleks Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Sarleks Help')
    end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
      :text => "Sarleks | Help")
    end
  end
  describe "About page" do
    it "should have the h1 'About Sarleks'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Sarleks')
    end
    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title',
      :text => "Sarleks | About")
    end
  end
end


