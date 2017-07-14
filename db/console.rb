require('pry')
require_relative('../modules/customers')
require_relative('../modules/films')
require_relative('../modules/tickets')

Customer.delete_all
Film.delete_all


# Customer management
customer1 = Customer.new( {'name' => 'John' , 'funds' => '250'} )
customer1.save

customer2 = Customer.new( {'name' => 'Chris' , 'funds' => '140,52'} )
customer2.save

customer3 = Customer.new( {'name' => 'Frank' , 'funds' => '45,35'} )
customer3.save

customer1.name = "Roman" 
customer1.funds = 23
customer1.update()

#Film management

film1 = Film.new ({'title' => 'Batman Forever', 'price' => '12.45'})
film1.save
film2 = Film.new ({'title' => 'Avengers : Era of Altron', 'price' => '15'})
film2.save
film3 = Film.new ({'title' => 'Pirates of the Carribean', 'price' => '21'})
film3.save

# binding.pry

#Tickets management
ticket1 = Tickets.new ({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save
ticket2 = Tickets.new ({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket2.save
ticket3 = Tickets.new ({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3.save
ticket4 = Tickets.new ({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket4.save



binding.pry
nil