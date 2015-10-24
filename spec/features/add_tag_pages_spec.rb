require 'rails_helper'

describe "Tag creation path" do
  user = FactoryGirl.create(:user)
  it "creates a new tag" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'New Tag'
    fill_in 'Category', :with => "deezl"
    click_on 'Submit'
    expect(page).to have_content "deezl"
  end

  it "rerenders new tag form if not filled out correctly" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'New Tag'
    fill_in 'Category', :with => ""
    click_on 'Submit'
    expect(page).to have_content "Please fill the Category field"
  end
end
