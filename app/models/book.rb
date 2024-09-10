class Book < ApplicationRecord
    include Hasquotes

    belongs_to :author
    has_many :quotes

    validates :title, presence: true

end
