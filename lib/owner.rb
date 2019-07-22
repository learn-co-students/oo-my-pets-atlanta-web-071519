require "pry"
require_relative 'cat'
require_relative 'dog'

class Owner
  attr_reader :name, :species, :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end

  def say_species 
    "I am a #{self.species}."
  end

  def self.all 
    @@all
  end

  def self.count 
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def buy_cat(name)
    # bc the it already adds the cat in the initialize method of Cat
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats 
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets 
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end

    @cats = []
    @dogs = []
  end  

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# jon = Owner.new("Jon")
# alex = Owner.new("Alex")
# cat = Cat.new("cat", jon)
# pam = Cat.new("pam", alex)
# binding.pry