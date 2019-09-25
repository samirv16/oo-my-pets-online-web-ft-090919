class Owner
  
  
  attr_reader :name, :species
  
  @@all = []
  @@count = 0

  
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    @@pets = {cats: [], dogs: []}
  end
  
  def say_species
   "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@count
  end
  
  def self.reset_all
    @@count = 0
  end 
  
  def cats
    Cat.all.select { |cat| cat.owner == self }
  end
  
  def dogs 
    Dog.all.select { |dog| dog.owner == self }
  end
  
  def buy_cat(name)
   @@pets[:cats] << Cat.new(name, self)
  end
  
  def buy_dog(name)
    @@pets[:dogs} << Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy" }
  end 
  
  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end
  
  def list_pets
    p "I have #{Dog.all.count}dog(s), and #{Cat.all.count} cat(s)."
    
  end 
  
  def sell_pets
    Dog.all.each { |dog| dog.mood = "nervous" }
    Cat.all.each { |cat| cat.mood = "nervous" }
    Dog.all.each { |dog| dog.owner = nil }
    Cat.all.each { |cat| cat.owner = nil }
  end 
  
  
end