class AddQuoteRefToAuthors < ActiveRecord::Migration[7.2]
  def change
    add_reference :authors, :quote, null: false, foreign_key: true
  end
end
