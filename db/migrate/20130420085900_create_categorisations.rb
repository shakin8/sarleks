class CreateCategorisations < ActiveRecord::Migration
  def change
    create_table :categorisations do |t|
      t.integer :portfolio_id
      t.integer :collection_id

      t.timestamps
    end
    add_index :categorisations, :portfolio_id
    add_index :categorisations, :collection_id
    add_index :categorisations, [:portfolio_id, :collection_id], unique: true
  end
end
