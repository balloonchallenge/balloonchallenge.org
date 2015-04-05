class AddTeamIdToAttachedAsset < ActiveRecord::Migration
  def change
    add_column :attached_assets, :team_id, :integer
  end
end
