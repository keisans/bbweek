class Monster < ActiveRecord::Base
  attr_accessible :defense, :dexterity, :intelligence, :max_hp, :name, :strength
end
