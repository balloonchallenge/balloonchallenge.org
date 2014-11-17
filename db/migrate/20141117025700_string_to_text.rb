class StringToText < ActiveRecord::Migration
  def change
    change_column :teams, :name, :text
    change_column :teams, :school, :text
    change_column :teams, :why_join, :text
    change_column :teams, :plan, :text
    change_column :teams, :find_out, :text
  end
end
