class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :pieces, [:user_id, :created_at]
  end
end
