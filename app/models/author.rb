class Author < ApplicationRecord
  belongs_to :book
  belongs_to :quote, optional: true

  validates :name, presence: true
end
