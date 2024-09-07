class RemoveAuthorIdFromBooks < ActiveRecord::Migration[7.2]
  def change
    remove_column :books, :author_id, :integer
  end
end
