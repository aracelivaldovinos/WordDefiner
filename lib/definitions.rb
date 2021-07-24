require 'pry'

class Definition
  ## Still need to remove attr_id
    attr_reader :id 
    attr_accessor :definition, :word_id
  
    @@definitions = {}
    @@total_def = 0
  
    def initialize(attributes)
      @definition = attributes.fetch(:definition)
      @word_id = attributes.fetch(:word_id)
      @id = attributes.fetch(:id) || @@total_def += 1
    end 
  
    def self.all 
      @@definitions.values()
    end 
  
    def save
      @@definitions[:id => @id] = Definition.new(:definition => @definition, :word_id => @word_id, :id => @id)
    end 
  
    def ==(compare_def)
      @definition
    end 
  
    def self.clear
      @@definitions ={}
      @@total_def = 0
    end 
  
    def self.find(id)
      @@definitions.fetch(:id => id)  
    end 
  
    def update(definition, word_id)
      @definition = definition
      @word_id = word_id
      @@definitions[:id => @id] = Definition.new(:definition => @definition, :word_id => @word_id, :id => @id)

      # @@definitions[self.id] = Definition.new(self.definition, self.word_id, self.id)


    end 
  
    def delete
      @@definitions.delete(@id)
    end 


    def self.find_by_word(wrd_id)
      definitions = []
      @@definitions.values.each do |definition|
        if definition.word_id == wrd_id
          definitions.push(definition)
        end
      end
      definitions
    end

    def word
      Word.find(self.word_id)
    end
  
  end 