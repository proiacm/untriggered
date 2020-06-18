# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
h = Emotion.new(name: "happy")
s = Emotion.new(name: "sad")
a = Emotion.new(name: "angry")
ent = User.last.entries.create(content: "I'm having a great day!")
ent.emotion = h 
ent = User.first.entries.create(content: "I'm having a bad day!")
ent.emotion = s
ent = User.first.entries.create(content: "I'm having a mad day!")
ent.emotion = a 
