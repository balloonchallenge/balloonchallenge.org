class AddDataToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :latitude, :string
    add_column :teams, :longitude, :string
    add_index :teams, :school, unique: true
    add_index :teams, :name, unique: true
  end
end
