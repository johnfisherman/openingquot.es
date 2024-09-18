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

    def index
        @quotes = Quote.all
    end

    def show
      # All the details we need for our quote
      # The quote
      @quote = Quote.find_by(slug: params[:id])
      # The person that put it down
      @quote_author = Author.find(@quote.author_id)
      # The book where it features
      @parent_book = Book.find(@quote.book_id)
      # The writer that decided to quote that other author, and that has written the book with this epigraph
      @parent_book_author = Author.find(@parent_book.author_id)
    end

    # Like strong type, but for form parameters
    def quote_params
        params.require(:quote).permit(:book_id, :body, :author_id)
    end
    
end
