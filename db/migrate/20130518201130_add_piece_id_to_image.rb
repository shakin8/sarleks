class AddPieceIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :piece_id, :integer
  end
end
