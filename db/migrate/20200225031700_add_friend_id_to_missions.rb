class AddFriendIdToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :friend_id, :integer
  end
end