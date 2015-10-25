require 'rails_helper'

describe "Tag delete path" do
  user = FactoryGirl.create(:user)
  tag = FactoryGirl.create(:tag)
  it "deletes a given tag" do
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on tag.category
    click_on 'Delete'
    expect(page).not_to have_content tag.category
  end
end
