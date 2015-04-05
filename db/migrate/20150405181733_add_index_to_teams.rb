class AddIndexToTeams < ActiveRecord::Migration
  def change
    add_index :teams, :launch_date
  end
end
