class AddColumnAdminToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :admin_id, :integer
  end
end
