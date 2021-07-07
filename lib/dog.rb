require "pry"

class Dog
  # code goes here
  attr_reader :name
  attr_accessor :owner 
  attr_accessor :mood 

  @@all_dogs = []

  def initialize(name, owner)
    @name = name
    @owner = owner 
    @mood = "nervous"
    @@all_dogs << self 
    @owner.dogs << self 
  end 

  def self.all
    @@all_dogs
  end 

  def remove_owner
    remove_instance_variable(:@owner)
  end

end