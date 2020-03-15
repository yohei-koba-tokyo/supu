class ChangeFriendIdOnMissions < ActiveRecord::Migration[5.2]
  def change
    change_column :missions, :friend_id, :integer, index: true, foreign_key: true
  end
end
