class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @author = Author.find_by(id: @book.author_id)
  end
end
