class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :user_1
      t.string :user_2
      t.string :turn
      t.string :icon, default: 'x'
      t.integer :size, default: 3
      t.text :board, array: true

      t.timestamps
    end
  end
end
