class AddDestinationToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :add_column, :integer
  end
end
