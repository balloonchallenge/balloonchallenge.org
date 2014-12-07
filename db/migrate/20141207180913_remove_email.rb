class RemoveEmail < ActiveRecord::Migration
  def change
    remove_column :requests, :user_email
  end
end
