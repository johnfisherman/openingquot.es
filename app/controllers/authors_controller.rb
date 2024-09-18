class AuthorsController < ApplicationController
    include Slugs

    def new
      @author = Author.new
    end
    
    def create
      @author = Author.new(author_params)
      # Create a slug for author
      @author.slug = create_slug(@author.name)

      if @author.save
          redirect_to @author
      else
          render :new, status: :unprocessable_entity
      end
    end

    def index
      @authors = Author.all
    end

    def show
      # Retrieve author based on slug
      @author = Author.find_by(slug: params[:id])
      @author_books = Book.where(author_id: @author.id)
      @quotes = Quote.all
      @quoted_quotes = @quotes.where(author_id: @author.id)
    end

    def author_params
      params.require(:author).permit(:name, :slug)
    end
end
