require "pry"

class Owner
  # code goes here
  attr_reader :name 
  attr_accessor :cats 
  attr_accessor :dogs 
  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
    @cats = []
    @dogs = []
  end 

  def species
    @species 
  end

  def say_species
    p "I am a #{@species}."
  end 

  def self.all
    @@all 
  end 

  def self.count
    @@all.count
  end 

  def self.reset_all
    @@all = []
  end 

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  
  end 

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
   
  end

  def walk_dogs
    @dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    @cats.map {|cat| cat.mood = "happy"}
  end 

  def sell_pets
    @dogs.map {|dog| dog.mood = "nervous"}
    @dogs.map {|dog| dog.remove_owner}
    
    @cats.map {|cat| cat.mood = "nervous"}
    @cats.map {|cat| cat.remove_owner}

    self.reset_pets
  end

  def reset_pets 
    @dogs = []
    @cats = []
  end

  def list_pets

    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end