require 'rails_helper'

describe "Destroy Comment path" do
  it "Destroys a comment to a given instance of Post" do
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
    click_on 'Delete'
    expect(page).to have_content "Comment deleted."
  end
end
