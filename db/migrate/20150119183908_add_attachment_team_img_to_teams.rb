class AddAttachmentTeamImgToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :team_img
    end
  end

  def self.down
    remove_attachment :teams, :team_img
  end
end
