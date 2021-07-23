require 'pry'

class Word
  @@words = {}
  @@total_words = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id) || @@total_words += 1
  end 

  def self.all 
    @@words.values()
  end 

end 

