class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :max_hp
      t.integer :strength
      t.integer :dexterity
      t.integer :intelligence
      t.integer :defense

      t.timestamps
    end
  end
end
