class FixPostgres < ActiveRecord::Migration
  def change
    change_column :requests, :user_id, :integer
  end
end
