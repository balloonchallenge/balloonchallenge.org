class AddIndexToAttachedAssets < ActiveRecord::Migration
  def change
    add_index :attached_assets, :category
  end
end
