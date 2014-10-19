class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :user_id
      t.integer :read_flg, default:0

      t.timestamps
    end
    add_index :messages, [:user_id, :created_at]
  end
end
