class Quote < ApplicationRecord
  belongs_to :book
  has_many :authors

  validates :body, presence: true

  def quote_author
    Author.find_by(id: self.author_id)
  end

end
