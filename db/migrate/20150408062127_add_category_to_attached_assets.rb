class AddCategoryToAttachedAssets < ActiveRecord::Migration
  def change
    add_column :attached_assets, :category, :string
  end
end
