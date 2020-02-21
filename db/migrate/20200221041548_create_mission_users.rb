class CreateMissionUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_users do |t|
      t.references :mission, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
