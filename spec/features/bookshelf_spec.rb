require 'spec_helper'

describe 'Bookshelves', js: true do

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

  it 'can add a new one' do
    expect(user.shelves.count).to eq(0)
    click_button 'Add bookshelf'
    expect(page).to have_content 'Bookshelf added.'
    expect(user.shelves.count).to eq(1)
  end

  it 'can be deleted' do
    bookshelf = create(:bookshelf, user: user)
    expect(user.shelves.count).to eq(1)
    click_button 'deleteTools'
    click_link 'Delete bookshelf'
    expect(page).to have_content 'Bookshelf deleted.'
    expect(user.shelves.count).to eq(0)
  end
end