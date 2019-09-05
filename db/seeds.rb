# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seed"
CartItem.destroy_all

puts 'aa'
Order.destroy_all
puts 'a'
Cart.destroy_all
puts 'b'
Restaurant.destroy_all
puts 'c'
Package.destroy_all
puts 'd'

User.destroy_all


User.create!(
    email: "quentin@gmail.com",
    password: "123456",
    address: "54 rue de Belleville 75019 Paris"
    )

User.create!(
    email: "gauthier@gmail.com",
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
    name: "Au Chat Noir",
    email: "auchatnoir@gmail.com",
    password: "123456",
    delivery_start_hour: "11:00",
    delivery_end_hour: "16:00",
    address: "76 Rue Jean-Pierre Timbaud, 75011 Paris"
    )
a.save

puts 'b'

b = Package.new(
    name: "Petit panier bio de la semaine",
    description: "1 salade frisée, 1 aubergine, 1 concombre, 3 poivrons, 4 tomates, 2 échalottes, 4 bananes",
    price: 8,
    category: "Fruits & legumes",
    bio: true,
    number_people: 2
    )
b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567163928/Fruits%20and%20Vegetables%20Baskets/4d68fd2976639205ef587864e9054977-2018-04-14_deiduz.jpg"
b.save


b = Package.new(
    name: "Petit panier de légumes bio",
    description: "5 tomates coeur de boeuf, 4 courgettes vertes, 2 salades batavia, 3 oignions doux, 1 brocoli, 8 carottes",
    price: 12,
    category: "Legumes",
    bio: true,
    number_people: 2
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567163700/Vegetables%20only%20Baskets/produit-panier-b1_2_uhkdbr.jpg"
b.save


b = Package.new(
    name: "Petit Panier ratatouille",
    description: "750g de tomates, 350g de courgettes, 350g d'aubergine, 350g de poivrons (rouges et/ou verts), 2 gousses d'ail, 1 brin de thym, 1 feuille de laurier",
    price: 16,
    category: "Legumes",
    bio: true,
    number_people: 3
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567086108/Vegetables%20only%20Baskets/Presentation_Project_Restos_d0ut0u.jpg"
b.save


b = Package.new(
    name: "Panier de fruits et légumes",
    description: "8 tomates coeur de boeuf, 4 courgettes vertes, 2 salades batavia, 3 oignions doux, 1 kg de haricots verts, 4 aubergines, 1 kg de raisin blanc, 3 kiwis, 5 oranges, 3 pamplemousses",
    price: 18,
    category: "Legumes",
    bio: true,
    number_people: 3
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567086139/Fruits%20only%20baskets/download_1_pk0t4o.jpg"
b.save


b = Package.new(
    name: "Panier de fruits de la semaine",
    description: "8 nectarines jaunes, 450g de framboises, 300g de myrtilles, 1 kg de bananes, 400g de litchis, 3 oranges, 400g de prunes, 2 kiwis",
    price: 20,
    category: "Fruits",
    bio: false,
    number_people: 2
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567086140/Fruits%20only%20baskets/panier-de-fruits-baroque_eokwlz.jpg"
b.save

b = Package.new(
    name: "Panier de légumes de la semaine",
    description: "3 courgettes, 7 tomates rondes, 10 pommes de terre, 3 oignons blancs, 3 salades batavia, 3 betteraves",
    price: 18,
    category: "Legumes",
    bio: false,
    number_people: 2
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567084806/Fruits%20and%20Vegetables%20Baskets/jjzig5empz6y6zmw5fsa_y6lzsx.jpg"
b.save

b = Package.new(
    name: "Grand panier ratatouille",
    description: "2 kgs de tomates, 700g de courgettes, 700g d'aubergine, 700g de poivrons (rouges et/ou verts), 5 gousses d'ail, 3 brins de thym, 5 feuilles de laurier",
    price: 17,
    category: "Legumes",
    bio: true,
    number_people: 6
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567086108/Vegetables%20only%20Baskets/Presentation_Project_Restos_d0ut0u.jpg"
b.save

b = Package.new(
    name: "Panier de fruits de Charente",
    description: "4 melons, 500g de framboises, 400g de rhubarbe, 1,5 kgs de nectarines, 400g de prunes",
    price: 20,
    category: "Fruits",
    bio: false,
    number_people: 3
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567086140/Fruits%20only%20baskets/download_nedrd7.jpg"
b.save

b = Package.new(
    name: "Panier de fruits du Languedoc",
    description: "1 kg d'abricots, 1 kg de poires, 500g  de framboises, 500g de myrtilles, 4 bananes, 5 kiwis",
    price: 22,
    category: "Fruits",
    bio: true,
    number_people: 3
        )

b.remote_photo_url = "http://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fdjgprimeur.com%2F228-292-large%2Fpanier-fruits-hiver-decouverte.jpg&f=1"
b.save

b = Package.new(
    name: "Panier de fruits bio",
    description: "4 melons, 500g de nirabelles, 3 fruits de la passion, 500g de mûres, 10 nectarines",
    price: 38,
    category: "Fruits",
    bio: true,
    number_people: 3
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567161256/Fruits%20only%20baskets/iu_sufb45.jpg"
b.save

b = Package.new(
    name: "Grand panier",
    description: "3 laitues romaines, 600g de nyrtilles, 5 poivrons, 2 kgs de tomates, 4 navets, 2kgs de potiron, 2 kgs de haricots verts, 1 kg de raisin blanc",
    price: 40,
    category: "Fruits & legumes",
    bio: false,
    number_people: 5
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567084747/Fruits%20and%20Vegetables%20Baskets/ozsckzjmjdjcoegvftdx_unljhb.jpg"
b.save

b = Package.new(
    name: "Grand panier bio de la semaine",
    description: "2 laitues romaines, 600g de nyrtilles, 7 poivrons, 3 kgs de tomates, 5 navets, 3 kgs de haricots verts, 1 kg d'aubergine, 500g de litchis, 4 oignons doux, 5 melons, 4 betteraves",
    price: 45,
    category: "Fruits & legumes",
    bio: true,
    number_people: 5
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567086108/Vegetables%20only%20Baskets/gp_palin_zwkou2.jpg"
b.save

b = Package.new(
    name: "Grand panier de la semaine",
    description: "2 laitues romaines, 600g de nyrtilles, 7 poivrons, 3 kgs de tomates, 5 navets, 3 kgs de haricots verts, 1 kg d'aubergine, 500g de litchis, 4 oignons doux, 5 melons, 4 betteraves",
    price: 40,
    category: "Fruits & legumes",
    bio: false,
    number_people: 5
        )

b.remote_photo_url = "http://res.cloudinary.com/dhf3phkaa/image/upload/v1567434592/Fruits%20and%20Vegetables%20Baskets/panier-de-fruits-et-legumes-janod_mmb7en.jpg"
b.save


puts "Seed finished"
