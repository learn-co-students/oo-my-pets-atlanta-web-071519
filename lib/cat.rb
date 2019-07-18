require "pry"

class Cat
  # code goes here
  attr_reader :name
  attr_accessor :owner 
  attr_accessor :mood 

  @@all_cats = []

  def initialize(name, owner)
    @name = name
    @owner = owner 
    @mood = "nervous"
    @@all_cats << self 
    @owner.cats << self 
  end 

  def self.all
    @@all_cats
  end 

  def remove_owner
    remove_instance_variable(:@owner)
  end

end