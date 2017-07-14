require_relative ('../db/sql_runner')


class Film
  attr_accessor :title, :price
  attr_reader :id
  def initialize(parameters)
    @title = parameters['title']
    @price = parameters['price'].to_f
    @id = parametrs['id'].to_i if parametrs['id']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUE ('#{@title}', price) RETURNING id"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE films WHERE (title, price) = ('#{@title}', #{@price})"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM films"
    Film.map_runner
  end

  def self.map_runner
    result = SqlRunner.run(sql)
    return result.map {|result| Film.new(result)}
  end

end