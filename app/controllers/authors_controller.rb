class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
        @author_books = Book.where(author_id: @author.id)
        @quotes = Quote.all
        @quoted_quotes = @quotes.where(author_id: @author.id)

    end
end
