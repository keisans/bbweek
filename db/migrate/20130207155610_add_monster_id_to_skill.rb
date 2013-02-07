class AddMonsterIdToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :monster_id, :integer
  end
end
