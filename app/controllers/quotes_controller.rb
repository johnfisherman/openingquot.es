class QuotesController < ApplicationController
  include Slugs

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    # Create a slug for book
    @quote.slug = create_slug(@quote.body.truncate_words(12))

    if @quote.save
      redirect_to @quote
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @quote = Quote.find_by(slug: params[:id])
  end

  def update
    @quote = Quote.find_by(slug: params[:id])

    if @quote.update(quote_params)
      redirect_to @quote
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @quotes = Quote.order(created_at: :desc)
  end

  def show
    # All the details we need for our quote
    # The quote
    @quote = Quote.find_by(slug: params[:id])
    # The person that put it down
    @quote_author = @quote.author
    # The book where it features
    @parent_book = @quote.book
    # The writer that decided to quote that other author, and that has written the book with this epigraph
    @parent_book_author = @parent_book.author
  end

  # Like strong type, but for form parameters
  def quote_params
    params.require(:quote).permit(:book_id, :body, :author_id)
  end
end
