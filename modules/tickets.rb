require_relative('../db/sql_runner')

class Tickets
  attr_accessor :customer_id , :film_id
  attr_reader :id

  def initialize(parameters)
    @customer_id = parameters['customer_id'].to_i
    @film_id = parameters['film_id'].to_i
    @id = parameters['id'].to_i if parameters['id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id , film_id) VALUES (#{@customer_id}, #{@film_id}) RETURNING id"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def films()
    sql = "SELECT * FROM "
  end

  def customers()
  end

  def self.show_all
    sql = "SELECT * FROM ticekts"
  end

  def self.delete_all
    sql = "DELETE from tickets"
    SqlRunner.run(sql)
  end

  def self.map_runner(sql)
    result = SqlRunner
    return result.maps {|result| Tickets.new(result)}
  end
end