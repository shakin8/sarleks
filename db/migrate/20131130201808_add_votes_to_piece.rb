class AddVotesToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :votes, :integer
  end
end
