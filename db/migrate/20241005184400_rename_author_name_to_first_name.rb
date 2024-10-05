class RenameAuthorNameToFirstName < ActiveRecord::Migration[7.2]
  def change
    rename_column :authors, :name, :first_name
  end
end
