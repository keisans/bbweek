class AddCurrentHpToMonster < ActiveRecord::Migration
  def change
    add_column :monsters, :current_hp, :integer
  end
end
