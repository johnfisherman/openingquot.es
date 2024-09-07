class Book < ApplicationRecord
    # has_many :authors
    belongs_to :author
    has_many :quotes

    validates :title, presence: true
end
