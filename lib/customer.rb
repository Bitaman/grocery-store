require "csv"
require "awesome_print"

class Customer
  def initialize(id, email, address)
    @id = id
    @email = email
    @address = address
  end

  attr_reader :id
  attr_accessor :email, :address

  def self.all
    customers = []
    CSV.read("data/customers.csv").each do |line|
      customers << Customer.new(line[0].to_i, line[1], {street: line[2], city: line[3], state: line[4], zip: line[5]})
      #return customers
    end
    return customers
  end
  def self.find(id)
    (Customer.all).find { |customer| customer.id == id }
  end
end
