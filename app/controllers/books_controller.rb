class BooksController < ApplicationController
  skip_after_filter  :verify_authorized, only: [:search, :random, :show]
  before_action :set_bookshelf, except: [:search, :random, :show]
  skip_before_filter :authenticate_user_from_token!, :only => [:random, :show]
  skip_before_filter :authenticate_user!, :only => [:random, :show]

  def index
    authorize @bookshelf

    render json: @bookshelf.books
  end

  def show
    @book = Book.find(params[:id])

    render json: @book
  end

  def create
    authorize @bookshelf
    @book = Book.new(book_params)

    if @book.isbn
      existing = Book.find_by(isbn: @book.isbn)
      if existing
        @book = existing
        @bookshelf.books << @book
        render json: @book, status: :created, location: bookshelf_book_url(@bookshelf, @book)
        return
      else
        user_ip = request.remote_ip
        google_books = GoogleBooks.search("isbn:#{@book.isbn}", {}, user_ip)
        @book = gbook_to_book google_books.first
        if @book.save
          @bookshelf.books << @book
          render json: @book, status: :created, location: bookshelf_book_url(@bookshelf, @book)
          return
        end
      end
    end

    render json: @book.errors, status: :unprocessable_entity
  end

=begin
  def update
    authorize @bookshelf
    @book = Book.find(params[:id])

    if @book.update(params[:book])
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end
=end

  def destroy
    authorize @bookshelf
    @book = Book.find(params[:id])

    @bookshelf.books.delete(@book)

    head :no_content
  end

  def search
    user_ip = request.remote_ip
    @books = []
    google_books = GoogleBooks.search(params[:search], {:count => 10}, user_ip)
    google_books.each do |google_book|
      book = gbook_to_book google_book
      @books.push book
    end
    @books.select!{|book| book.isbn}
    render json: @books
  end

  def random
    @book = Book.all.sample

    render json: @book
  end

  def clear
    authorize @bookshelf
    @bookshelf.books.clear
  end

  private

  def gbook_to_book(google_book)
    Book.new(
        title: google_book.title,
        authors: google_book.authors,
        publisher: google_book.publisher,
        published_date: google_book.published_date,
        description: google_book.description,
        isbn: google_book.isbn,
        page_count: google_book.page_count,
        print_type: google_book.print_type,
        categories: google_book.categories,
        language: google_book.language,
        image_link: google_book.image_link)
  end

  def set_bookshelf
    @bookshelf = Shelf.find(params[:bookshelf_id])
  end

  def book_params
    params.require(:book).permit(:isbn)
  end
end
