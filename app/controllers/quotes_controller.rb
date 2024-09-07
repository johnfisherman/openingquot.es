class QuotesController < ApplicationController
    def index
        @quotes = Quote.all
    end

    def show
        @quote = Quote.find(params[:id])
        @quote_author = Author.find(@quote.author_id)
        @parent_book = Book.find(@quote.book_id)
        @parent_book_author = Author.find_by(book_id: @parent_book.id)
    end
end
