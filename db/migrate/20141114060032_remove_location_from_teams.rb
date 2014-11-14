class RemoveLocationFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :location
    add_column :teams, :city, :string, null: false, default: ""
    add_column :teams, :state_code, :string
    add_column :teams, :country_code, :string, null: false, default: ""
  end
end
