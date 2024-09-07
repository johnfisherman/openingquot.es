class RemoveNullConstraint < ActiveRecord::Migration[7.2]
  def change
    change_column :authors, :quote_id, :integer, :null => true
  end
end
