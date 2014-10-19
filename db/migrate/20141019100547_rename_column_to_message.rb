class RenameColumnToMessage < ActiveRecord::Migration
  def change
    #rename_column :target_table, :old_column, :new_column
    rename_column :messages, :add_column, :destination
  end
end
