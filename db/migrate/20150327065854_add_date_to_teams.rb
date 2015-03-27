class AddDateToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :launch_date, :string
  end
end
