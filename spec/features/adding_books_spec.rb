require 'spec_helper'

describe 'Adding books', js: true do

  let!(:user){create(:user)}
  let!(:bookshelf){create(:bookshelf, user: user)}

  before :each do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content 'A bookshelf'
    expect(page).to have_content 'The bookshelf is empty!'

    stub_request(:get, /.*/).to_return(body: File.new('spec/json/volumes.json'), headers: { 'Content-Type' => "application/json; charset=UTF-8" })
  end

  after :each do
    click_link 'Sign out'
    expect(page).not_to have_content 'Sign out'
  end

  it 'is successful when clicking add on search page' do
    expect(bookshelf.books.count).to eq(0)
    click_button 'Add books'
    fill_in 'Search', with: 'jee'
    click_button 'Search'
    click_button '9780307555038'
    expect(page).to have_content 'Added'
    click_link 'My bookshelves'
    expect(page).not_to have_content 'The bookshelf is empty!'
    expect(bookshelf.books.count).to eq(1)
  end

  it 'is successful when clicking multiple adds on search page' do
    expect(bookshelf.books.count).to eq(0)
    click_button 'Add books'
    fill_in 'Search', with: 'jee'
    click_button 'Search'
    click_button '9780307555038'
    sleep 1.second
    click_button '9781568821443'
    click_link 'My bookshelves'
    expect(page).not_to have_content 'The bookshelf is empty!'
    expect(bookshelf.books.count).to eq(2)
  end
end