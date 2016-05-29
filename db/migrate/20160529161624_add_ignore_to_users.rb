class AddIgnoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_ignore, :boolean
  end
end
