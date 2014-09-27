class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.column 'user_id', :integer
      t.column 'group_id', :integer
      t.timestamps
    end
  end
end
