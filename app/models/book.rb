class Book < ApplicationRecord
    has_many :authors
    has_many :quotes

    validates :title, presence: true
end
