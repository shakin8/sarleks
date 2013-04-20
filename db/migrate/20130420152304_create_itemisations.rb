class CreateItemisations < ActiveRecord::Migration
  def change
    create_table :itemisations do |t|
      t.integer :collection_id
      t.integer :piece_id

      t.timestamps
    end
    add_index :itemisations, :collection_id
    add_index :itemisations, :piece_id
    add_index :itemisations, [:piece_id, :collection_id], unique: true
  end
end
