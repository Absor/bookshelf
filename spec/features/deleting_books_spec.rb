require 'spec_helper'

describe 'Deleting books', js: true do

  let!(:user){create(:user)}
  let!(:bookshelf){create(:bookshelf_with_books, user: user)}

  before :each do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Sign out'
    expect(page).to have_content 'A bookshelf'
    expect(page).not_to have_content 'The bookshelf is empty!'
    click_button 'Show all'
    expect(page).not_to have_content 'Show all'
  end

  after :each do
    click_link 'Sign out'
    expect(page).not_to have_content 'Sign out'
  end

  it 'can clear all books in a shelf' do
    expect(bookshelf.books.count).to eq(5)
    click_button 'deleteTools'
    click_link 'Clear bookshelf'
    expect(page).to have_content 'Bookshelf cleared.'
    expect(bookshelf.books.count).to eq(0)
  end

  it 'can delete a single book' do
    expect(bookshelf.books.count).to eq(5)
    book = bookshelf.books.first
    click_button "delete#{book.id}"
    expect(page).to have_content 'Book deleted.'
    expect(bookshelf.books.count).to eq(4)
  end
end