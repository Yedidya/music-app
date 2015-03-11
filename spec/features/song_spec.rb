require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'
require 'capybara/rspec'


describe "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password', :username => 'Bob')
  end

  it "signs me in" do
    visit new_user_session_path
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    expect(page).to have_content 'Bob'
  end

  it "creates a new user" do
    visit new_user_registration_path
      fill_in 'Choose a username', :with => 'Anthony'
      fill_in 'Email', :with => 'anthony@aol.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Confirm Password', :with => 'password'
    click_button 'Sign Up'
    expect(page).to have_content 'Anthony'
  end


end