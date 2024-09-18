class AddSlugToQuotes < ActiveRecord::Migration[7.2]
  def change
    add_column :quotes, :slug, :string
  end
end
