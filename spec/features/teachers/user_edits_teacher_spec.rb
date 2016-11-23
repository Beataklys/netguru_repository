require 'spec_helper'

feature 'User edits teacher spec' do
  let!(:teacher) { create :teacher, first_name: 'Pies', last_name: 'Pluto', academic_title: 'Dr.' }
  let!(:subject_item) { create :subject_item, title: 'History of NY' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit teachers_path
    find(:xpath, "//a[@title='edit']").click
  end

  scenario 'and checks breadcrumbs presence' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Teachers  » Dr. Pies Pluto'
    end
  end

  scenario 'with valid input' do
    find('#teacher_academic_title').find(:xpath, 'option[3]').select_option
    click_button 'Update Teacher'
    expect(page).to have_content 'Teacher has been updated!'
    expect(page).to have_content 'TA'
  end

  scenario 'by assigning subject item' do
    visit reports_subjects_path
    expect(page).to have_no_content 'History of NY (Pies Pluto)'

    visit teachers_path
    find(:xpath, "//a[@title='edit']").click
    find("input[type='checkbox']").set(true)
    click_button 'Update Teacher'

    visit reports_subjects_path
    expect(page).to have_content 'History of NY (Pies Pluto)'
  end
end
