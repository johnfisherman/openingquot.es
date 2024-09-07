class Quote < ApplicationRecord
  belongs_to :book
  has_many :authors

  validates :body, presence: true
end
