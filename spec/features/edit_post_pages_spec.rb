require 'rails_helper'

describe "Edit Post path" do
  it "edits a new post" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Go'
    click_on 'Edit', match: :first
    fill_in 'Title', :with => "Two Scoops"
    fill_in 'Body', :with => "I love ice-cream and you. :)"
    click_on 'Submit'
    expect(page).to have_content "Two Scoops"
  end

  it "rerenders the edit form if cells are left blank" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Go'
    click_on 'Edit', match: :first
    fill_in 'Title', :with => ""
    fill_in 'Body', :with => "I love ice-cream and you. :)"
    click_on 'Submit'
    expect(page).to have_content "You must fill in all parts of the form."
  end
end
