class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :damage
      t.string :attribute

      t.timestamps
    end
  end
end
