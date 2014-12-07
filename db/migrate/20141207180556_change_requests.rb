class ChangeRequests < ActiveRecord::Migration
  def change
    add_column :requests, :user_email, :string 
    remove_column :requests, :request_time
  end
end
