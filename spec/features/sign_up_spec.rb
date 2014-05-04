require 'spec_helper'

describe 'Signing up', js: true do

  before :each do
    visit '/'
    click_link 'Sign up'
  end

  it 'fails with no input' do
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank."
    expect(page).to have_content "Password can't be blank."
  end

  it 'fails with wrong email' do
    fill_in 'Email', with: 'testi@testi'
    fill_in 'Password', with: 'testitesti'
    fill_in 'Password confirmation', with: 'testitesti'
    click_button 'Sign up'
    expect(page).to have_content "Email is invalid."
  end

  it 'fails with short password' do
    fill_in 'Email', with: 'testi@testi.fi'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'
    click_button 'Sign up'
    expect(page).to have_content "Password is too short (minimum is 8 characters)."
  end

  it 'fails with no password confirmation' do
    fill_in 'Email', with: 'testi@testi.fi'
    fill_in 'Password', with: '12345678'
    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password."
  end

  it 'is successful with correct input' do
    expect(User.count).to be(0)
    fill_in 'Email', with: 'testi@testi.fi'
    fill_in 'Password', with: '1234567a'
    fill_in 'Password confirmation', with: '1234567a'
    click_button 'Sign up'
    expect(page).to have_content 'Sign out'
    click_link 'Sign out'
    expect(page).not_to have_content 'Sign out'
    expect(User.count).to be(1)
  end
end