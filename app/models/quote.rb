class Quote < ApplicationRecord
  # Keep using helper link_to, seamlessly
  def to_param
    self.slug
  end

  belongs_to :book
  belongs_to :author, optional: true

  validates :body, presence: true

  def quote_author
    Author.find_by(id: self.author_id)
  end
end
