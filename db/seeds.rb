# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  [
    {name:"admin", email:"admin@0000", password:"00000000",},
    {name:"test1", email:"aa@aa", password:"11111111",},
    {name:"test2", email:"bb@bb", password:"11111111",},
  ]
)
OwnTime.create(
  [
    {name:"睡眠時間", user_id:"1", time_type:"0", shareFlg:"0", publicLevel:"0"},
    {name:"必須", user_id:"1", time_type:"1", shareFlg:"0", publicLevel:"0"},
    {name:"価値", user_id:"1", time_type:"2", shareFlg:"0", publicLevel:"0"},
    {name:"錯覚", user_id:"1", time_type:"3", shareFlg:"0", publicLevel:"0"},
    {name:"無駄", user_id:"1", time_type:"4", shareFlg:"0", publicLevel:"0"},
  ]
)