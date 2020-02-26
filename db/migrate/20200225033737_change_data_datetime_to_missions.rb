class ChangeDataDatetimeToMissions < ActiveRecord::Migration[5.2]
  def change
    change_column :missions, :datetime, :date
  end
end
