require 'rails_helper'

RSpec.describe 'Expenses', type: :feature do
  before :each do
    User.destroy_all
    Category.destroy_all
    @u1 = User.create(name: 'Jane Doe', password: 'password', email: 'jane@email.com')
    visit new_user_session_path
    fill_in 'Email', with: 'jane@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
  end

  it 'displays the custom navigation bar when the user is signed in' do
    expect(page).to have_selector('div.authentication-pages')
  end

  it 'displays the categories section when the user is signed in' do
    expect(page).to have_selector('div.field')
  end

  it 'displays the "New Category" button when the user is signed in' do
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'displays the "password" button when the user is signed in' do
    expect(page).to have_content('Password')
  end

  it 'displays the "email" button when the user is signed in' do
    expect(page).to have_content('Remember me')
  end
end
