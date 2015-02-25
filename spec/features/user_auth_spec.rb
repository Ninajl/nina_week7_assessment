require 'rails_helper'

describe 'User logging in' do
    scenario 'Username is unique' do
      @user = User.create(user_name: "test11", password: "test11")
      visit '/sessions'
      fill_in 'user_name', :with => "test11"
      fill_in 'password', :with => "test11"
      click_button 'Sign In'
      expect(page).to have_content "Welcome to this crazy thing called Life"
    end
end
