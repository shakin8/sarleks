class AddDefaultValueToPiecesScoreAttribute < ActiveRecord::Migration
def up
    change_column :pieces, :score, :integer, default: 0
end

def down
    change_column :pieces, :score, :integer, default: nil
end
end
