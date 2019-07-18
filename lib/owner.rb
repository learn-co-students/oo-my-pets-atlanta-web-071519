require 'pry'
require_relative 'cat'
require_relative 'dog'

class Owner
  attr_reader :name, :species
  @@all = []
  @@count = 0

  def initialize(name, species="human", cats = [], dogs = [])
    @name = name
    @species = species
    @@all << self
    @@count +=1
    @cats = cats
    @dogs = dogs
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    @cats
  end

  def dogs
    @dogs
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dog|
    dog.mood= "happy"
    end
  end

  def feed_cats
    @cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = @cats.concat @dogs
    pets.each do |pet|
      pet.mood= "nervous"
      pet.owner = nil
    end
    cats.clear
    dogs.clear
  end
  
  
  def list_pets
    "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
  end

end