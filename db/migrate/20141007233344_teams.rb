class Teams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name,      null: false, default: ""
      t.string :location
      t.string :school
      t.text :description
    end
  end
end
