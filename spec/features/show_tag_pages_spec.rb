# require 'rails_helper'
#
# describe "Show Tag path" do
#   it "displays a tag and the posts associated with it" do
#     admin = FactoryGirl.create(:user)
#     user = FactoryGirl.create(:non_admin_user)
#     tag = FactoryGirl.create(:tag)
#     post = FactoryGirl.create(:post)
#     visit '/'
#     click_on "Sign In"
#     fill_in 'Email', :with => admin.email
#     fill_in 'Password', :with => admin.password
#     click_on 'Go'
#     click_on 'Edit', match: :first
#     fill_in 'Title', :with => "Two Scoops"
#     fill_in 'Body', :with => "I love ice-cream and you. :)"
#     check(tag.category, match: :first)
#     click_button 'Submit'
#     click_button 'Log Out'
#     fill_in 'Email', :with => user.email
#     fill_in 'Password', :with => user.password
#     click_on 'Go'
#     click_on tag.category
#     expect(page).to have_content 'Two Scoops'
#   end
# end
