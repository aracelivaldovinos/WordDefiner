require 'rspec'
require 'words'
require 'definitions'
require 'pry'

describe '#Definition' do

before(:each) do
  Definition.clear()
end
  describe('.all') do
    it("it will return empty array") do 
      expect(Definition.all).to(eq([]))
    end 
  end 

  describe('#save') do
    it("it will save definition in the @@definition hash") do 
      definition = Definition.new({:definition => "easy", :id => @id})
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end 
  end 

  describe('#==') do
    it("its the same definition if it has the same attributes") do 
      definition = Definition.new({:definition => "easy", :id => @id})
      definition.save()
      definition1 = Definition.new({:definition => "easy", :id => @id})
      definition.save()
      expect(definition).to(eq(definition1))
    end 
  end 

  describe('.clear') do
    it("it will clear definitions hash") do 
      definition = Definition.new({:definition => "easy", :id => @id})
      definition.save()
      definition1 = Definition.new({:definition => "easy", :id => @id})
      definition.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end 
  end

  ## Need to work on find and update
  describe('.find') do
    it("it will find definition by id") do 
      definition = Definition.new({:definition => "easy", :id => 1})
      definition.save()
      definition1 = Definition.new({:definition => "hard", :id => 2})
      definition.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end 
  end

  describe('#update') do
    it("it will update definition by id") do 
      definition = Definition.new({:definition => "easy", :id => 1})
      definition.save()
      definition.update("hard")
      expect(definition.definition()).to(eq("hard"))
    end 
  end

  ##

  describe('#delete') do
  it("it will delete name by id") do 
    definition = Definition.new({:definition => "easy", :id => 1})
    definition.save()
    definition1 = Definition.new({:definition => "hard", :id => 2})
    definition.save()
    definition.delete()
    expect(Definition.all).to(eq([definition1]))
  end 
end
end 

