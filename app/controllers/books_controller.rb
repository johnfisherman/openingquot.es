class BooksController < ApplicationController
  include Slugs

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    # Create a slug for book
    @book.slug = create_slug(@book.title)

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(slug: params[:id])
    @author = Author.find(@book.author_id)
    @quote = Quote.find_by(book_id: @book.id)
    if @book.has_quote?
      @quote_author = Author.find(@quote.author_id)
    end
  end

  # Like strong type, but for form parameters
  def book_params
    params.require(:book).permit(:title, :year, :author_id, :isbn)
  end
end
