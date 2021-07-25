require 'pry'
class Word
  attr_reader :input, :id 
  @@inputs = {}
  @@total_inputs = 0 

  def initialize (input, id)
    @input = input
    @id = id || @@total_inputs += 1
  end 

  def self.all
    @@inputs.values()
  end

  def save
    @@inputs[self.id] = Word.new(self.input, self.id)
  end

  def ==(compare_word)
    self.input() == compare_word.input()
  end 

  def self.clear
    @@inputs = {}
    @@total_inputs = 0
  end

  def self.find(id)
    @@inputs[id]
  end 

  def update(word)
    @word = word 
  end 

  def delete
    @@words.delete(self.id)
  end 

  def definitions
    Definition.find_by_word(self.id)
  end

end 