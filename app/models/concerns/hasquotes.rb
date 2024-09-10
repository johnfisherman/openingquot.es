module Hasquotes
    extend ActiveSupport::Concern

    #Does this book open with a quote?
    def has_quote?
        @quote = Quote.where(book_id: id).first
        if @quote.nil? || @quote.body.empty?
            return false
        else 
            return true
        end
    end
end
