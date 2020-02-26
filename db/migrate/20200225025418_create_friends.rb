class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true
      t.integer :sex
      t.date :birth
      t.string :twitter
      t.text :memo
      t.timestamps
    end
  end
end
