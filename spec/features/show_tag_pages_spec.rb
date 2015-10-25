require 'rails_helper'

describe "Show User path" do
  it "displays a user's profile information" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Go'
    click_on 'Profile'
    expect(page).to have_content user.name
  end
end
