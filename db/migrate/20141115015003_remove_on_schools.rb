class RemoveOnSchools < ActiveRecord::Migration
  def change
    remove_index :teams, :name => 'index_teams_on_school'
  end
end
