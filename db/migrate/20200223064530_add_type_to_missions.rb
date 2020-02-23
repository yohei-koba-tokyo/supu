class AddTypeToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :type, :integer
  end
end
