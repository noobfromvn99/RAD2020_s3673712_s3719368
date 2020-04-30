# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
Topic.destroy_all
NEWS = Topic.create!(name:"News")
RMIT = Topic.create!(name:"RMIT")
VR = Topic.create!(name:"V.R.")
AI = Topic.create!(name:"A.I.")

User.destroy_all
RAD  = User.create!(name:"RAD",email:"RAD@RAD.com",mobile:"0433838666",password:"Rails2020",city:"Melbourne")

