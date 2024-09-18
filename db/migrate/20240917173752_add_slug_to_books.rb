class AddSlugToBooks < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :slug, :string
  end
end
