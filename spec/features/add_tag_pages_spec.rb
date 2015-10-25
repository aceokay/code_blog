require 'rails_helper'

describe "Tag creation path" do
  it "creates a new tag" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'New Tag'
    fill_in 'Category', :with => "deezl"
    click_on 'Submit'
    expect(page).to have_content "deezl"
  end

  it "rerenders new tag form if not filled out correctly" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'New Tag'
    fill_in 'Category', :with => ""
    click_on 'Submit'
    expect(page).to have_content "Please fill the Category field"
  end

  it "adds a tag to a post" do
    user = FactoryGirl.create(:user)
    tag = FactoryGirl.create(:tag)
    post = FactoryGirl.create(:post)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'Edit', match: :first
    fill_in 'Title', :with => "Two Scoops"
    fill_in 'Body', :with => "I love ice-cream and you. :)"
    check(tag.category, match: :first)
    click_button 'Submit'
    click_on 'Two Scoops'
    expect(page).to have_content 'deezl tru'
  end

  it "removes a tag from a post" do
    user = FactoryGirl.create(:user)
    tag = FactoryGirl.create(:tag)
    post = FactoryGirl.create(:post)
    visit '/'
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on 'Edit', match: :first
    fill_in 'Title', :with => "Two Scoops"
    fill_in 'Body', :with => "I love ice-cream and you. :)"
    uncheck(tag.category, match: :first)
    click_on 'Submit'
    click_on 'Two Scoops'
    expect(page).not_to have_content 'deezl tru'
  end
end
