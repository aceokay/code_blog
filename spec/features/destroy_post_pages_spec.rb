require 'rails_helper'

describe "Destroy Post path" do
  it "deletes a given instance of Post" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'Edit', match: :first
    click_on 'Delete'
    expect(page).not_to have_content post.title
  end
end
