class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.float :isbn

      t.timestamps
    end
  end
end
