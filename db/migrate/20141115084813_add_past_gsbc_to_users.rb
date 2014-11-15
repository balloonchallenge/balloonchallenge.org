class AddPastGsbcToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gsbc_last_year, :boolean
  end
end
