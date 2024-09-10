module Hasquotes
  extend ActiveSupport::Concern

  #Does this book open with a quote?
  def has_quote?
    @quote = Quote.find_by(book_id: id)
    @quote&.body.present?
  end
end
