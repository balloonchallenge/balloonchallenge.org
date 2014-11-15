class TeamsUpdatedFields < ActiveRecord::Migration
  def change
    add_column :teams, :why_join, :string
    add_column :teams, :plan, :string
    add_column :teams, :find_out, :string
    add_column :teams, :ages, :text
    add_column :teams, :host_payload, :boolean
    add_column :teams, :have_payload, :boolean
    add_column :teams, :buddies_mentor, :boolean
    add_column :teams, :buddies_mentee, :boolean
  end
end
