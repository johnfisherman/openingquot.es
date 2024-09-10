module Hasquotes
    extend ActiveSupport::Concern

    def has_quote?
        Rails.logger.info 'Does this book open with a quote?'
        @quote = Quote.where(book_id: id).first
        if @quote.nil? || @quote.body.empty?
            return false
        else 
            return true
        end
    end
end
