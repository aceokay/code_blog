# require 'rails_helper'
#
# describe "User sign-up and login path" do
#   user = FactoryGirl.create(:user)
  # it "adds a user" do
  #   visit '/'
  #   click_on "Sign Up"
  #   fill_in 'Display Name', :with => user.name
  #   fill_in 'Email (required, but never shown)', :with => user.email
  #   fill_in 'Password', :with => user.password
  #   fill_in 'Confirm Password', :with => user.password
  #   click_on 'Confirm Sign Up'
  #   click_on "Sign In"
  #   fill_in 'Email', :with => user.email
  #   fill_in 'Password', :with => "lzeed"
  #   click_on "Log in"
  #   expect(page).to have_content "Email"
  # end
  #
  # it "adds a user, logs in and logs out" do
  #   visit '/'
  #   click_on "Sign Up"
  #   fill_in 'Display Name', :with => "Deezl"
  #   fill_in 'Email (required, but never shown)', :with => "deezl@earthlink.com"
  #   fill_in 'Password', :with => "lzeed"
  #   fill_in 'Confirm Password', :with => "lzeed"
  #   click_on 'Confirm Sign Up'
  #   click_on "Sign In"
  #   fill_in 'Email', :with => "deezl@earthlink.com"
  #   fill_in 'Password', :with => "lzeed"
  #   click_on "Log in"
  #   click_on "Profile"
  #   click_on "Log Out"
  #   expect(page).to have_content "wackoveture"
  #   expect(page).not_to have_content "Log Out"
  # end
# end
