class AddVeteranInfoToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :signed_up_2015, :boolean
    add_column :teams, :signed_up_2016, :boolean
    add_column :teams, :flew_2015, :boolean
    add_column :teams, :flew_2014, :boolean
    Team.all.each do |team|
      if team.created_at < Date.new(2015, 5, 1)
        team.update_attributes(:signed_up_2015 => true)
      end
    end
  end
end
