class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.integer :portfolio_id
      t.string :name

      t.timestamps
    end
    add_index :collections, [:user_id, :created_at]
    add_index :collections, [:portfolio_id, :created_at]
  end
end
