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
    email: "test@mail.com",
    password: "123456",
    address: "54 rue de Belleville 75019 Paris"
    )

User.create!(
    email: "edouard@gmail.com",
    password: "123456",
    address: "34 rue de Vaugirard 75015 Paris"
    )

User.create!(
    email: "martine@wanadoo.com",
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
    name: "L'Estaminet",
    email: "lestaminet@gmail.com",
    password: "123456",
    delivery_start_hour: "09:00",
    delivery_end_hour: "14:00",
    address: "116 Rue Oberkampf, 75011 Paris"
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

a = Restaurant.new(
    name: "Le Perchoir",
    email: "auperchoir@gmail.com",
    password: "123456",
    delivery_start_hour: "11:00",
    delivery_end_hour: "16:00",
    address: "14 Rue Crespin du Gast, 75011 Paris"
    )
a.save

a = Restaurant.new(
    name: "Au Chat Noir",
    email: "auchatnoir@gmail.com",
    password: "123456",
    delivery_start_hour: "11:00",
    delivery_end_hour: "16:00",
    address: "76 Rue Jean-Pierre Timbaud, 75011 Paris"
    )
a.save

a = Restaurant.new(
    name: "Bocamexa",
    email: "auchatnoir@gmail.com",
    password: "123456",
    delivery_start_hour: "11:00",
    delivery_end_hour: "16:00",
    address: "95 Rue Oberkampf, 75011 Paris"
    )
a.save

a = Restaurant.new(
    name: "La cantine de Belleville",
    email: "belleville@gmail.com",
    password: "123456",
    delivery_start_hour: "11:00",
    delivery_end_hour: "16:00",
    address: "108 Boulevard de Belleville, 75020 Paris"
    )
a.save

a = Restaurant.new(
    name: "Cannibale Café",
    email: "cannibales@gmail.com",
    password: "123456",
    delivery_start_hour: "11:00",
    delivery_end_hour: "16:00",
    address: "93 Rue Jean-Pierre Timbaud, 75011 Paris"
    )
a.save

puts 'b'

b = Package.new(
    name: "Petit panier bio de la semaine",
    description: "1 laitue romaine, 300g de nyrtilles,  3 poivrons, 4 tomates",
    price: 9,
    category: "Fruits & Legumes",
    bio: true
        )
b.remote_photo_url = "https://static.pourdebon.com/images/290-216/b8e1f5c4f307efbb15615c2bdab70b70/4d68fd2976639205ef587864e9054977-2018-04-14.jpeg"
b.save


b = Package.new(
    name: "Petit panier de légumes bio",
    description: "8 tomates coeur de boeuf, 4 courgettes vertes, 2 salades batavia, 3 ognions doux",
    price: 12,
    category: "Legumes",
    bio: true
        )

b.remote_photo_url = "http://www.localizz.fr/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/p/r/produit-panier-b1_2.jpg"
b.save


b = Package.new(
    name: "Panier ratatouille 3 personnes",
    description: "750 g de tomates, 350 g de courgettes, 350 g d'aubergine, 350 g de poivrons (rouges et/ou verts)",
    price: 16,
    category: "Legumes",
    bio: true
        )

b.remote_photo_url = "https://static.pourdebon.com/images/290-216/301d8409513a1bedd18756cb11c54d9b/ebe441b8130bc9b4d041abcee210d636-2018-06-29.jpeg"
b.save


b = Package.new(
    name: "Panier de légumes bio",
    description: "8 tomates coeur de boeuf, 4 courgettes vertes, 2 salades batavia, 3 ognions doux, 1 kg de haricots verts, 4 aubergines",
    price: 18,
    category: "Legumes",
    bio: true
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1567086139/Fruits%20only%20baskets/download_1_pk0t4o.jpg"
b.save


b = Package.new(
    name: "Panier de fruits de la semaine",
    description: "8 nectarines jaunes, 450g de framboises, 300g de myrtilles, 1 kg de bananes, 400g de litchis, 3 melons",
    price: 20,
    category: "Fruits",
    bio: false
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1567086140/Fruits%20only%20baskets/panier-de-fruits-baroque_eokwlz.jpg"
b.save

b = Package.new(
    name: "Panier de légumes de la semaine",
    description: "3 courgettes, 7 tomates rondes, 10 pommes de terre, 3 oignons blancs, 3 salades batavia, 3 betteraves",
    price: 18,
    category: "Legumes",
    bio: false
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1567084806/Fruits%20and%20Vegetables%20Baskets/jjzig5empz6y6zmw5fsa_y6lzsx.jpg"
b.save

b = Package.new(
    name: "Panier ratatouille 6 personnes",
    description: "2 kgs de tomates, 700 g de courgettes, 700 g d'aubergine, 700 g de poivrons (rouges et/ou verts)",
    price: 17,
    category: "Legumes",
    bio: true
        )

b.remote_photo_url = "https://static.pourdebon.com/images/290-216/4a87ae5068be4d5f562ca437e258e6b5/e28dfd7855f5cb929c1fc591e8484007-2018-06-29.jpeg"
b.save

b = Package.new(
    name: "Panier de fruits de Charente",
    description: "4 melons, 500g de framboises, 400g de rhubarbe",
    price: 20,
    category: "Fruits",
    bio: false
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1567086140/Fruits%20only%20baskets/download_nedrd7.jpg"
b.save

b = Package.new(
    name: "Panier de fruits du Languedoc",
    description: "1 kg d'abricots, 1 kg de poires, 500g  de framboises, 500g de myrtilles",
    price: 22,
    category: "Fruits",
    bio: true
        )

b.remote_photo_url = "https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fdjgprimeur.com%2F228-292-large%2Fpanier-fruits-hiver-decouverte.jpg&f=1"
b.save

b = Package.new(
    name: "Panier de fruits bio",
    description: "4 melons, 500g de nirabelles, 3 fruits de la passion, 500g de mûres, 10 nectarines",
    price: 38,
    category: "Fruits",
    bio: true
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1567161256/Fruits%20only%20baskets/iu_sufb45.jpg"
b.save

b = Package.new(
    name: "Grand panier",
    description: "3 laitues romaines, 600g de nyrtilles, 5 poivrons, 2 kgs de tomates, 4 navets, 2kgs de potiron, 2 kgs de haricots verts",
    price: 40,
    category: "Fruits & legumes",
    bio: false
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1567084747/Fruits%20and%20Vegetables%20Baskets/ozsckzjmjdjcoegvftdx_unljhb.jpg"
b.save

b = Package.new(
    name: "Grand panier bio de la semaine",
    description: "2 laitues romaines, 600g de nyrtilles, 7 poivrons, 3 kgs de tomates, 5 navets, 3 kgs de haricots verts, 1 kg d'aubergine, 500g de litchis, 4 oignons doux, 5 melons, 4 betteraves",
    price: 45,
    category: "Fruits & legumes",
    bio: true
        )

b.remote_photo_url = "https://res.cloudinary.com/dhf3phkaa/image/upload/v1567086108/Vegetables%20only%20Baskets/gp_palin_zwkou2.jpg"
b.save

puts "Seed finished"
