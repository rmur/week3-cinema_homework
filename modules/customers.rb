require_relative('../db/sql_runner')


class Customer
  attr_accessor :name , :funds
  attr_reader :id
  def initialize(parameters)
    @name = parameters['name']
    @funds = parameters['funds'].to_i
    @id = parameters['id'].to_i if parameters['id']
  end  

  def self.delete_all
    sql = "DELETE FROM customers;"
  end
end