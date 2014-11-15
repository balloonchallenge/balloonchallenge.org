class TeamAges < ActiveRecord::Migration
  def change
    remove_column :teams, :ages
    add_column :teams, :ages_0_10, :boolean
    add_column :teams, :ages_11_17, :boolean
    add_column :teams, :ages_18_26, :boolean
    add_column :teams, :ages_27_50, :boolean
    add_column :teams, :ages_50_up, :boolean
  end
end
