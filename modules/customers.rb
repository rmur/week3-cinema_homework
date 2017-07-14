require_relative('../db/sql_runner')
require_relative('./films')


class Customer
  attr_accessor :name , :funds
  attr_reader :id
  def initialize(parameters)
    @name = parameters['name']
    @funds = parameters['funds'].to_f
    @id = parameters['id'].to_i if parameters['id']
  end  

  def save()
    sql = "INSERT INTO customers(name , funds) VALUES ('#{@name}', #{@funds}) RETURNING id"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET 
    (name, funds) = ('#{@name}', #{@funds}) 
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def films()
    #logic - select all films from films table 
    #join it with tickets where film_id correlates to films.id from the table
    # with the customer ID 
    sql = "SELECT films.* FROM films          
    INNER JOIN tickets ON tickets.film_id = films.id 
    WHERE customer_id = #{@id}
    "
    Film.map_runner(sql)

  end

  def self.show_all()
    sql = "SELECT * FROM customers;"
    Customer.map_runner
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def self.map_runner(sql)
    result = SqlRunner.run(sql)
    return result.map{ | result | Customer.new(result)}
  end
end