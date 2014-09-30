class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string     :type      # Only needed if using single table inheritance
    end

    create_table :group_memberships do |t|
      t.string     :member_type     # Necessary to make polymorphic members work
      t.integer    :member_id       # The id of the member that belongs to this group
      t.integer    :group_id        # The group to which the member belongs
      t.string     :group_name      # The named group to which a member belongs (if using)
      t.string     :membership_type # The type of membership the member belongs with
    end

    add_index :group_memberships, [:member_id, :member_type]
    add_index :group_memberships, :group_id
    add_index :group_memberships, :group_name
  end
end