class AddSignedUp2017ToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :signed_up_2017, :boolean
    add_column :teams, :flew_2016, :boolean
  end
end
