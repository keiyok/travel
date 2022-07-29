class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :place
      t.string :content
      t.date :start_day
      t.date :last_day
      t.integer :people
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
