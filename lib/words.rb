require 'pry'

class Word
## Still need to remove attr_id
  attr_reader :id 
  attr_accessor :word

  @@words = {}
  @@total_words = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id) || @@total_words += 1
  end 

  def self.all 
    @@words.values()
  end 

  def save
    @@words[:id => @id] = Word.new(:word => @word, :id => @id)
  end 

  def ==(compare_word)
    @word
  end 

  def self.clear
    @@words ={}
    @@total_words = 0
  end 

  def self.find(id)
    @@words.fetch(:id => id)  
  end 

  def update(word)
    @word = word 
  end 

end 

