class AuthorsController < ApplicationController
  include Slugs

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    # Create a slug for author
    @author.slug = create_slug(@author.first_name)

    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find_by(slug: params[:id])
  end

  def update
    @author = Author.find_by(slug: params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @authors = Author.all
  end

  def show
    # Retrieve author based on slug
    @author = Author.find_by(slug: params[:id])
    @author_books = @author.books
    @quotes = Quote.all
    @quoted_quotes = @author.quotes
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :slug)
  end
end
