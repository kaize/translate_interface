# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create [{name: "admin"}, {name: "guest"}, {name: "owner"}, {name: "translator"}, {name: "user"}]

Locale.create [{name: :en}, {name: :us}, {name: :ru}]