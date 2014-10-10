class AddTeamsIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team_id, :integer
    add_index :users, :team_id
  end
end
