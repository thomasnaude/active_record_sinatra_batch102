Restaurant.destroy_all

tour_d_argent = Restaurant.new({
  name: "La Tour d'Argent",
  address: "15 Quai de la Tournelle, 75005 Paris",
  rating: 5
})
tour_d_argent.save!

chez_gladines = Restaurant.new({
  name: "Chez Gladines",
  address: "30 Rue des cinq Diamants, 75013 Paris",
  rating: 3
})
chez_gladines.save!

pizza_nico = Restaurant.new(
  name: "Pizza Nico",
  address: "Bordeaux",
  rating: 1
)
pizza_nico.save!

fufu = Restaurant.new(
  name: "Fufu",
  address: "Bordeaux",
  rating: 4
)
fufu.save!
