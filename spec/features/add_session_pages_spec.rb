require 'rails_helper'

describe "Session creation/User login path" do
  user = FactoryGirl.create(:user)
  it "logs a user in and creates a new session" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    expect(page).to have_content "You've been logged in."
  end

  it "displays an error if not logged in" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => "chee"
    click_on 'Log in'
    expect(page).to have_content "There was a problem logging you in."
  end

  it "logs a user in and creates a new session" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'Log Out'
    expect(page).to have_content "You've been logged out successfully."
  end
end
