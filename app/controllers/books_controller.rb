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

  def edit
    @book = Book.find_by(slug: params[:id])
  end

  def update
    @book = Book.find_by(slug: params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find_by(slug: params[:id])
    @author = @book.author
    @quotes = @book.quotes
  end

  # Like strong type, but for form parameters
  def book_params
    params.require(:book).permit(:title, :year, :author_id, :isbn)
  end
end
