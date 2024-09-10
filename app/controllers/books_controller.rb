class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @author = Author.find(@book.author_id)
    @quote = Quote.find_by(book_id: @book.id)
    if @book.has_quote?
      @quote_author = Author.find(@quote.author_id)
    end
  end
end
