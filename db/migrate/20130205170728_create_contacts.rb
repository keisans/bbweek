class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :age
      t.string :job

      t.timestamps
    end
  end
end
