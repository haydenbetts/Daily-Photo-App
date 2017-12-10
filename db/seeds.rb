# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john_doe = User.create! :name => 'John Doe', :email => 'john8@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
pine_tree = GrowingThing.create :name => "The Pine Tree Outside"
baby_boy = GrowingThing.create :name => "Baby Boy"

day_1 = Day.create :post_date => 'Sat, 02 Dec 2017', :note => 'The tree grew a lot today'
day_2 = Day.create :post_date => 'Sun, 03 Dec 2017', :note => 'The tree grew a little today'
day_3 = Day.create :post_date => 'Fri, 01 Dec 2017', :note => 'The tree grew a little today'
day_4 = Day.create :post_date => 'Fri, 01 Dec 2017', :note => 'The boy grew a tiny bit today'
day_5 = Day.create :post_date => 'Sat, 02 Dec 2017', :note => 'The boy grew a lot today'
day_6 = Day.create :post_date => 'Wed, 28 Nov 2017', :note => 'Sad boy today'
day_7 = Day.create :post_date => 'Thu, 29 Nov 2017', :note => 'happy boy today'

john_doe.growing_things.push(pine_tree, baby_boy)
john_doe.save

pine_tree.days.push(day_1, day_2)
pine_tree.save

baby_boy.days.push(day_4, day_5, day_6, day_7)
baby_boy.save
