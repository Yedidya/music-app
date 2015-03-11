require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'
require 'capybara/rspec'


describe "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'password', :username => 'Bob')
    visit new_user_session_path
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    click_button 'Sign in'
  end

  it "signs me in" do
    expect(page).to have_content 'Bob'
  end
end

describe "the signup process", :type => :feature do
  before :each do
    visit new_user_registration_path
      fill_in 'Choose a username', :with => 'Anthony'
      fill_in 'Email', :with => 'anthony@aol.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Confirm Password', :with => 'password'
    click_button 'Sign Up'
  end


  it "creates a new user" do
    User.last.username == 'Anthony'
  end

  it "leads us to the users home page" do
    expect(page).to have_content('Anthony')
  end
end



