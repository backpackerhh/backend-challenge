# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'A teacher', type: :feature do
  scenario 'logged in can see expected content' do
    teacher = create(:teacher)
    create(:course)

    sign_in teacher

    visit root_path

    expect(page).to have_selector(:link_or_button, 'Log out')
    expect(page).not_to have_selector(:link_or_button, 'Log in')
    expect(page).not_to have_selector(:link_or_button, 'Sign up')

    click_link 'Teachers'

    expect(page).to have_selector(:link_or_button, 'Vote')

    click_link 'Courses'

    expect(page).to have_selector(:link_or_button, 'Vote')
    expect(page).to have_selector(:link_or_button, 'New course')

    click_link 'Enrollments'

    expect(page).to have_selector(:link_or_button, 'New enrollment')
  end

  scenario 'logged out can see expected content' do
    create(:teacher)
    create(:course)

    visit root_path

    expect(page).to have_selector(:link_or_button, 'Log in')
    expect(page).to have_selector(:link_or_button, 'Sign up')
    expect(page).not_to have_selector(:link_or_button, 'Log out')

    click_link 'Teachers'

    expect(page).not_to have_selector(:link_or_button, 'Vote')

    click_link 'Courses'

    expect(page).not_to have_selector(:link_or_button, 'Vote')
    expect(page).not_to have_selector(:link_or_button, 'New course')

    click_link 'Enrollments'

    expect(page).not_to have_selector(:link_or_button, 'New enrollment')
  end
end
