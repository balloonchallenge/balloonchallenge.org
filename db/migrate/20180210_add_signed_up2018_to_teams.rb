class AddSignedUp2018ToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :signed_up_2018, :boolean
    add_column :teams, :flew_2017, :boolean
  end
end
