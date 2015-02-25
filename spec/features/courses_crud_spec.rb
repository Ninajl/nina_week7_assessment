require 'rails_helper'

describe 'User can CRUD courses' do

  scenario 'User can create course' do
    visit '/courses'
    click_on 'Create Course'
    fill_in 'course[title]', with: "Math"
    check 'course[day]', "checked"
    click_on 'Create Course'
    expect(page).to have_content "Math"
  end

  scenario 'User can view a show page for a course' do
    course = Course.create(title: "blah")
    visit '/courses'
    click_on 'blah'
    expect(page).to have_content "blah"
  end
  #
  scenario 'User can edit a course' do
    course = Course.create(title: "blah")
    visit '/courses'
    click_on 'blah'
    click_on 'Edit Course'
    click_on 'Update Course'
    expect(page).to have_content "Courses Index Page"
  end
  #
  scenario 'User can delete a course' do
    course = Course.create(title: "blah")
    visit '/courses'
    click_on 'Delete Course'
    expect(page).to have_content "Courses Index Page"
  end
end
