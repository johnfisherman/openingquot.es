class AddAuthorRefToQuotes < ActiveRecord::Migration[7.2]
  def change
    add_reference :quotes, :author, null: false, foreign_key: true
  end
end
