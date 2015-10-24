require 'rails_helper'

describe "User sign-up path" do
  user = FactoryGirl.create(:user)
  it "adds a user" do
    visit '/'
    click_on "Sign Up"
    fill_in 'Name', :with => user.name
    fill_in 'Email', :with => "fakeEmailTo@Confuse.Uniqueness"
    fill_in 'Password', :with => user.password
    fill_in 'Password confirmation', :with => user.password
    click_on 'Go'
    expect(page).to have_content "Welcome to the site!"
  end
end
