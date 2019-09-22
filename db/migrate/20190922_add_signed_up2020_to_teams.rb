class AddSignedUp2020ToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :signed_up_2020, :boolean
    add_column :teams, :flew_2019, :boolean
  end
end
