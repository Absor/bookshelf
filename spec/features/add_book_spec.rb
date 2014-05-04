require 'spec_helper'

describe 'Adding books', js: true do

  let!(:user){create(:user)}

  before :each do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Sign out'
  end

  after :each do
    click_link 'Sign out'
    expect(page).not_to have_content 'Sign out'
  end

  it '-' do

  end
end