class QuotesController < ApplicationController
    def index
        @quotes = Quote.all
    end

    def show
        # All the details we need for our quote
        # The quote
        @quote = Quote.find(params[:id])
        # The person that put it down
        @quote_author = Author.find(@quote.author_id)
        # The book where it features
        @parent_book = Book.find(@quote.book_id)
        # The writer that decided to quote that other author, and that has written the book with this epigraph
        @parent_book_author = Author.find(@parent_book.author_id)
    end
    
end
