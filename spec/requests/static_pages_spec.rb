require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Sarleks" }

  describe "Home page" do
    it "should have the h1 'Sarleks Home'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sarleks Home')
    end
    it "should have the title 'Sarleks Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
      :text => "#{base_title} | Home")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
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
      :text => "#{base_title} | Help")
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
      :text => "#{base_title} | About")
    end
  end

  describe "Contact page" do
    it "should have the h1 'Contact Sarleks'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Sarleks')
    end
    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title',
      :text => "Sarleks | Contact")
    end
  end
end


