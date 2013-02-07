# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

monsters = Monster.create([{name: 'Bugbear', max_hp: 20, strength: 15, dexterity: 12, intelligence: 8, defense: 12}, {name: 'Thief', max_hp: 22, strength: 10, dexterity: 18, intelligence: 13, defense: 20}])