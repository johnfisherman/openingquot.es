class Book < ApplicationRecord
    include Hasquotes

    # Keep using helper link_to, seaminglessly
    def to_param
      self.slug
    end

    belongs_to :author
    has_many :quotes

    validates :title, presence: true

end
