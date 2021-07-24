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
      definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => @id})
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end 
  end 

  describe('#==') do
    it("its the same definition if it has the same attributes") do 
      definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => @id})
      definition.save()
      definition1 = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => @id})
      definition.save()
      expect(definition).to(eq(definition1))
    end 
  end 

  describe('.clear') do
    it("it will clear definitions hash") do 
      definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => @id})
      definition.save()
      definition1 = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => @id})
      definition.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end 
  end

  ## Need to work on find and update
  describe('.find') do
    it("it will find definition by id") do 
      definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => 1})
      definition.save()
      definition1 = Definition.new({:definition => "free from worries or problems", :word_id => @word_id, :id => 2})
      definition.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end 
  end

  describe('#update') do
    it("it will update definition by id") do 
      definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => 1})
      definition.save()
      definition.update("free from worries or problems", :word_id => @word_id)
      expect(definition.definition()).to(eq("free from worries or problems"))
    end 
  end

  ##

  describe('#delete') do
  it("it will delete defintion by id") do 
    definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => 1})
    definition.save()
    definition1 = Definition.new({:definition => "free from worries or problems", :word_id => @word_id, :id => 2})
    definition.save()
    definition.delete()
    expect(Definition.all).to(eq([definition1]))
  end 
end

describe('.find_by_word') do
  it("finds definitions for a word") do
    word = Word.new({:word => "easy", :id => @id})
    word.save()
    definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => 1})
    definition.save()
    definition1 = Definition.new({:definition => "free from worries or problems", :word_id => word.id, :id => 2})
    definition1.save()
    expect(Definition.find_by_word(word.id)).to(eq([definition1]))
  end
end

describe('#word') do
    it("finds the word a defintion belongs to") do
    definition = Definition.new({:definition => "without difficulty or effort", :word_id => @word_id, :id => 1})
    definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end
end 

