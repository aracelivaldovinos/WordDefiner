require 'pry'

class Definition
  ## Still need to remove attr_id
    attr_reader :id 
    attr_accessor :definition
  
    @@definitions = {}
    @@total_def = 0
  
    def initialize(attributes)
      @definition = attributes.fetch(:definition)
      @id = attributes.fetch(:id) || @@total_def += 1
    end 
  
    def self.all 
      @@definitions.values()
    end 
  
    def save
      @@definitions[:id => @id] = Definition.new(:definition => @definition, :id => @id)
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
  
    def update(definition)
      @definition = definition
    end 
  
    def delete
      @@definitions.delete(@id)
    end 
  
  end 