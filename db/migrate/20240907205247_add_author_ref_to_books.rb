class AddAuthorRefToBooks < ActiveRecord::Migration[7.2]
  def change
    add_reference :books, :author, null: false, foreign_key: true
  end
end
