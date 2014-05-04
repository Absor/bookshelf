require 'spec_helper'

describe 'Signing in', js: true do

  before :each do
    visit '/'
    click_link 'Sign in'
  end

  let!(:user){create(:user)}

  it 'is successful with right login information' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Sign out'
    click_link 'Sign out'
    expect(page).not_to have_content 'Sign out'
  end

  it 'fails with wrong password' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'
    expect(page).to have_content 'Wrong email or password.'
  end

  it 'fails with wrong username' do
    fill_in 'Email', with: 'wrongemail'
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Wrong email or password.'
  end

  it 'fails with wrong input' do
    fill_in 'Email', with: 'wrongemail'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'
    expect(page).to have_content 'Wrong email or password.'
  end
end