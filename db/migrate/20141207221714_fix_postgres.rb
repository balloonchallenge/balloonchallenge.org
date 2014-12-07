class FixPostgres < ActiveRecord::Migration
  def change
    change_column :requests, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
