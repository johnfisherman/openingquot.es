class RemoveNullConstraintForBooksOnAuthors < ActiveRecord::Migration[7.2]
  def change
    change_column :authors, :book_id, :integer, :null => true
  end
end
