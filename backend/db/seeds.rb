puts "Planting the beer seeds"

Beer.destroy_all
User.destroy_all

u1 = User.create(name: "Thomas", password: "1234")
u2 = User.create(name: "Eric", password: "4321")

b1= u1.beers.create(name: "Beer 1", malt_type: "Crystal Malt", hop_type: "Cascade", hop_amount: 1, yeast_type: "US05", yeast_amount: 1, water_ph: 1, water_amount: 1 )
b2= u2.beers.create(name: "Beer 2", malt_type: "Crystal Malt", hop_type: "Azaca", hop_amount: 2, yeast_type: "US06", yeast_amount: 2, water_ph: 2, water_amount: 2 )

puts "Beer has been planted"

