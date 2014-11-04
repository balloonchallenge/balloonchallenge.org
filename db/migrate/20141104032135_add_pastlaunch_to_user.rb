class AddPastlaunchToUser < ActiveRecord::Migration
  def change
    add_column :users, :pastlaunch, :boolean
  end
end
