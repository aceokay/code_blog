require 'rails_helper'

describe "Add Post path" do
  user = FactoryGirl.create(:user)
  tag = FactoryGirl.create(:tag)
  post = FactoryGirl.create(:post)
  it "adds a new post" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'Title', :with => "Two Scoops"
    fill_in 'Body', :with => "I love ice-cream and you. :)"
    check(tag.category, match: :first)
    click_on 'Submit'
    expect(page).to have_content "Two Scoops"
  end

  it "rerenders the post form if any part is left blank" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'New Post'
    fill_in 'Title', :with => "Two Scoops"
    fill_in 'Body', :with => ""
    check(tag.category, match: :first)
    click_on 'Submit'
    expect(page).to have_content "You must fill in all parts of the form."
  end
end
