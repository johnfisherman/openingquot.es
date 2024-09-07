class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
        @author_books = Book.where(author_id: @author.id)
    end
end
