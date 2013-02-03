require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Sarleks" }

  describe "Home page" do
    it "should have the h1 'Sarleks Home'" do
      visit root_path
      page.should have_selector('h1', text: "Sarleks Home")
    end
    it "should have the title 'Sarleks'" do
      visit root_path
      page.should have_selector('title', text: "#{base_title}")
    end
    it "should not have a custom page title" do
      visit root_path
      page.should_not have_selector('title', text: '| Home')
    end
  end

  describe "Help page" do
    it "should have the h1 'Sarleks Help'" do
      visit help_path
      page.should have_selector('h1', text: 'Sarleks Help')
    end
    it "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title', text: "#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have the h1 'About Sarleks'" do
      visit about_path
      page.should have_selector('h1', text: 'About Sarleks')
    end
    it "should have the title 'About'" do
      visit about_path
      page.should have_selector('title', text: "#{base_title} | About")
    end
  end

  describe "Contact page" do
    it "should have the h1 'Contact Sarleks'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact Sarleks')
    end
    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_selector('title', text: "Sarleks | Contact")
    end
  end
end


