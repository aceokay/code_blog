require 'rails_helper'

describe "Tag destroy path" do
  it "deletes a given tag" do
    user = FactoryGirl.create(:user)
    tag = FactoryGirl.create(:tag)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Go'
    click_on tag.category
    click_on 'Delete'
    expect(page).not_to have_content tag.category
  end
end
