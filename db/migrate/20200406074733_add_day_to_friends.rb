class AddDayToFriends < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :day, :integer
  end
end
