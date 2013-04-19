class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :portfolios, [:user_id, :created_at]  
  end
end
