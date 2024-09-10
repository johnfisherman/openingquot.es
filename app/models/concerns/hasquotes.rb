module Hasquotes
  extend ActiveSupport::Concern

  #Does this book open with a quote?
  def has_quote?
    @quote = Quote.find_by(book_id: id)
    if @quote.nil? || @quote.body.blank?
      return false
    else 
      return true
    end
  end
end
