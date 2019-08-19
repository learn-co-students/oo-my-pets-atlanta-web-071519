require 'pry'
class Owner
  attr_reader :name, :species
  
  @@all = []

  def initialize(name,species = "human")
    @name = name
    @species = species
    @@all << self
  end



  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all 
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select{|pero| pero.owner == self}
  end

  def buy_cat(x)
    Cat.new(x,self)
  end

  def buy_dog(x)
    Dog.new(x,self)
  end

  def walk_dogs
    Dog.all.map{|pero| pero.mood = 'happy'}
  end

  def feed_cats
    Cat.all.map{|gato| gato.mood = 'happy'}
  end

  def sell_pets
    #binding.pry
    pets = self.cats + self.dogs
    pets.map{|pet| pet.mood = 'nervous' }
    pets.map{|pet| pet.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
    

end