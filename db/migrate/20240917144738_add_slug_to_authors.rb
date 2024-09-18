class AddSlugToAuthors < ActiveRecord::Migration[7.2]
  def change
    add_column :authors, :slug, :string
  end
end
