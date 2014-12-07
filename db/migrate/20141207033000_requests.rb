class Requests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :user_id
      t.belongs_to :team
      t.datetime :request_time
      t.timestamps
    end
  end
end
