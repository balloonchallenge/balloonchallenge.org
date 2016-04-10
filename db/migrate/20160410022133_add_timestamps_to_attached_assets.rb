class AddTimestampsToAttachedAssets < ActiveRecord::Migration
  def change
    change_table :attached_assets do |t|
      t.timestamps
    end

  end
end
