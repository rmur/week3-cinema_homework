require('pry')
require_relative('../modules/customers')
require_relative('../modules/films')
require_relative('../modules/tickets')

Customer.delete_all

customer1 = Customer.new( {'name' => 'John' , 'funds' => '250'} )

binding.pry
nil