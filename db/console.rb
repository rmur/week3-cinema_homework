require('pry')
require_relative('../modules/customers')
require_relative('../modules/films')
require_relative('../modules/tickets')

Customer.delete_all
# Customer creation
customer1 = Customer.new( {'name' => 'John' , 'funds' => '250'} )
customer1.save

customer2 = Customer.new( {'name' => 'Chris' , 'funds' => '140,52'} )
customer2.save

customer3 = Customer.new( {'name' => 'Frank' , 'funds' => '45,35'} )
customer3.save


binding.pry
nil