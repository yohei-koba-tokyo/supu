class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.string :name, null:false
      t.datetime :datetime
      t.text :comment
      t.timestamps
    end
  end
end
