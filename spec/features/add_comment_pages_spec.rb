require 'rails_helper'

describe "Add Comment path" do
  it "adds a comment to a given instance of Post" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on post.title
    click_on 'Leave a Comment'
    fill_in 'Title', :with => "Where I Agree With You"
    fill_in 'Body', :with => "Nowhere"
    click_on 'Submit'
    expect(page).to have_content "Comment made."
    expect(page).to have_content "Where I Agree With You"
    expect(page).to have_content "Nowhere"
  end

  it "rerenders the new comment form if any items are left blank" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on post.title
    click_on 'Leave a Comment'
    fill_in 'Title', :with => ""
    fill_in 'Body', :with => ""
    click_on 'Submit'
    expect(page).to have_content "Please try again, something went wrong."
  end
end
