class AddScoreToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :score, :integer
  end
end
