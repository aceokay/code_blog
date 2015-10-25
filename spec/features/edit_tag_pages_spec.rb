require 'rails_helper'

describe "Tag edit path" do
  it "edits a given tag" do
    user = FactoryGirl.create(:user)
    tag = FactoryGirl.create(:tag)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on tag.category
    click_on 'Edit'
    fill_in 'Category', :with => "dougl"
    click_on 'Submit'
    expect(page).to have_content "dougl"
  end

  it "rerenders form for tag edit if left blank" do
    user = FactoryGirl.create(:user)
    tag = FactoryGirl.create(:tag)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on tag.category
    click_on 'Edit'
    fill_in 'Category', :with => ""
    click_on 'Submit'
    expect(page).to have_content "Please fill the Category field"
  end
end
