class RenameColumnToMessageDestination < ActiveRecord::Migration
  def change
    rename_column :messages, :destination, :post_to_id
  end
end
