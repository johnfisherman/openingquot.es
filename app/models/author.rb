class Author < ApplicationRecord
  # Keep using helper link_to, seamlessly
  def to_param
    self.slug
  end

  has_many :quotes

  validates :name, presence: true
  # validates :slug, presence: true
end
