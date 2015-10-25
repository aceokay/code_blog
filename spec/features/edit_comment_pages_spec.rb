require 'rails_helper'

describe "Edit Comment path" do
  it "edits a comment to a given instance of Post" do
    user = FactoryGirl.create(:user)
    non_admin = FactoryGirl.create(:non_admin_user)
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => non_admin.email
    fill_in 'Password', :with => non_admin.password
    click_on 'Go'
    click_on post.title
    click_on 'Edit'
    fill_in 'Title', :with => "Where I Agree With You"
    fill_in 'Body', :with => "Nowhere"
    click_on 'Submit'
    expect(page).to have_content "Comment updated"
    expect(page).to have_content "Where I Agree With You"
    expect(page).to have_content "Nowhere"
  end

  it "rerenders the edit form if items are left blank" do
    user = FactoryGirl.create(:user)
    non_admin = FactoryGirl.create(:non_admin_user)
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => non_admin.email
    fill_in 'Password', :with => non_admin.password
    click_on 'Go'
    click_on post.title
    click_on 'Edit'
    fill_in 'Title', :with => ""
    fill_in 'Body', :with => ""
    click_on 'Submit'
    expect(page).to have_content "Please try again, something went wrong."
  end
end
