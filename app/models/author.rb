class Author < ApplicationRecord
  # Keep using helper link_to, seaminglessly
  def to_param
    self.slug
  end

  belongs_to :quote, optional: true

  validates :name, presence: true
  # validates :slug, presence: true
end
