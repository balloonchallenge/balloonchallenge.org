class FirstNameLastNameUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    User.all.each do |user|
      fn, ln = user.name.split(' ', 2)
      user.update(first_name: fn, last_name: ln)
    end
  end
end
