class AddDefaultValueToPiecesVotesAttribute < ActiveRecord::Migration
def up
    change_column :pieces, :votes, :integer, default: 0
end

def down
    change_column :pieces, :votes, :integer, default: nil
end
end
