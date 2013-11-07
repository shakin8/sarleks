class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :piece_id

      t.timestamps
    end

      add_index :upvotes, :user_id
      add_index :upvotes, :piece_id
      add_index :upvotes, [:piece_id, :user_id], unique: true
  end
end
