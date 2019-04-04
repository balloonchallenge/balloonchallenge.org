class AddSignedUp2019ToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :signed_up_2019, :boolean
    add_column :teams, :flew_2018, :boolean
  end
end
