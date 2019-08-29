# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seed"
Restaurant.destroy_all
Package.destroy_all
User.destroy_all
Order.destroy_all



User.create!(
    email: "toto@gmail.com",
    password: "123456",
    address: "54 rue de Belleville 75019 Paris"
    )

User.create!(
    email: "owner@gmail.com",
    password: "123456",
    address: "34 rue de Vaugirard 75015 Paris"
    )

User.create!(
    email: "loueur@gmail.com",
    password: "123456",
    address: "12 rue Oberkampf 75011 Paris"
    )


puts 'a'

a = Restaurant.new(
    name: "Pitaya",
    email: "pitaya@gmail.com",
    password: "123456",
    delivery_start_hour: "12:00",
    delivery_end_hour: "19:00",
    address: "121 Rue Oberkampf, 75011 Paris"
    )
a.save

a = Restaurant.new(
    name: "Les Deux Megots",
    email: "lesdeuxmegots@gmail.com",
    password: "123456",
    delivery_start_hour: "09:00",
    delivery_end_hour: "14:00",
    address: "131 Rue Oberkampf, 75011 Paris"
    )
a.save

a = Restaurant.new(
    name: "La Mère Poule",
    email: "lamerpoule@gmail.com",
    password: "123456",
    delivery_start_hour: "11:00",
    delivery_end_hour: "16:00",
    address: "101 Rue Oberkampf, 75011 Paris"
    )
a.save

puts 'b'

b = Package.new(
    name: "Légumes de l'été - Région du Roussillon",
    description: "8 tomates coeur de boeuf, 4 courgettes vertes, 2 salades batavia, 3 ognions doux",
    price: 40,
    category: "Legumes",
    bio: true
        )
b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1566827389/vegetable_basket_6_dcjsuu.jpg"
b.save


b = Package.new(
    name: "Fruits de l'été - Région Aquitaine",
    description: "10 nectarines blanches, 5 melons jaunes, 10 figues rondes, 125g de framboises",
    price: 30,
    category: "Fruits",
    bio: false
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1566825251/vegetable_basket_3_jh8cxd.jpg"
b.save


b = Package.new(
    name: "Panaché de fruits et légumes bio - Région charentaise",
    description: "10 nectarines blanches, 5 melons jaunes, 8 tomates coeur de boeuf, 4 courgettes vertes",
    price: 30,
    category: "Fruits & Legumes",
    bio: true
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1566825252/vegetable_basket_4_mebqqz.jpg"
b.save


puts "Seed finished"
