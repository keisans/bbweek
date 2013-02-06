class CreateGhosts < ActiveRecord::Migration
  def change
    create_table :ghosts do |t|
      t.string :name
      t.integer :age
      t.string :game
      t.string :color

      t.timestamps
    end
  end
end
