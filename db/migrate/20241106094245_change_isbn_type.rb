class ChangeIsbnType < ActiveRecord::Migration[7.2]
  def change
    change_table :books do |t|
      t.change :isbn, :string
    end
  end
end
