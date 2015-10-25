require 'rails_helper'

describe "Tag edit path" do
  user = FactoryGirl.create(:user)
  tag = FactoryGirl.create(:tag)
  it "edits a given tag" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on tag.category
    fill_in 'Category', :with => "dougl"
    click_on 'Submit'
    expect(page).to have_content "dougl"
  end

  it "rerenders form for tag edit if left blank" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on tag.category
    fill_in 'Category', :with => ""
    click_on 'Submit'
    expect(page).to have_content "Please fill the Category field"
  end
end
