require 'rails_helper'

describe "Session creation/User login path" do
  it "logs a user in and creates a new session" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Go'
    expect(page).to have_content "You've been logged in."
  end

  it "displays an error if not logged in" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => "chee"
    click_on 'Go'
    expect(page).to have_content "There was a problem logging you in."
  end

  it "logs a user in and creates a new session" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Go'
    click_on 'Log Out'
    expect(page).to have_content "You've been logged out successfully."
  end
end
