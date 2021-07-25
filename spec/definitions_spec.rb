require 'rspec'
require 'definitions'
require 'words'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("easy", nil)
    @word.save()
  end

  describe('#==') do
  it("is the same definition if it has the same attributes as another definition") do
    definition1 = Definition.new("without difficulty or effort", @word.id, nil)
    definition2 = Definition.new("without difficulty or effort", @word.id, nil)
    expect(definition1).to(eq(definition2))
  end
end

describe('.all') do
  it("returns a list of all definitions") do
    definition1 = Definition.new("without difficulty or effort", @word.id, nil)
    definition1.save()
    definition2 = Definition.new("free from worries or problems", @word.id, nil)
    definition2.save()
    expect(Definition.all).to(eq([definition1, definition2]))
  end
end
describe('.clear') do
  it("clears all definitions") do
    definition1 = Definition.new("without difficulty or effort", @word.id, nil)
    definition1.save()
    definition2 = Definition.new("free from worries or problems", @word.id, nil)
    definition2.save()
    Definition.clear()
    expect(Definition.all).to(eq([]))
  end
end
describe('#save') do
it("saves a definition") do
  definition1 = Definition.new("without difficulty or effort", @word.id, nil)
  definition1.save()
  expect(Definition.all).to(eq([definition1]))
end
end
describe('.find') do
  it("finds definition by id") do
    definition1 = Definition.new("without difficulty or effort", @word.id, nil)
    definition1.save()
    definition2 = Definition.new("free from worries or problems", @word.id, nil)
    definition2.save()
    expect(Definition.find(definition1.id)).to(eq(definition1))
     
  end
end

  describe('#update') do
    it("it will update definition by id") do 
      definition = Definition.new("without difficulty or effort", @word.id, 1)
      definition.save()
      definition.update("free from worries or problems", @word.id)
      expect(definition.definition()).to(eq("free from worries or problems"))
    end 
  end


  describe('#delete') do
  it("it will delete defintion by id") do 
    definition = Definition.new("without difficulty or effort", @word.id, 1)
    definition.save()
    definition1 = Definition.new("free from worries or problems", @word.id, 2)
    definition1.save()
    definition.delete()
    expect(Definition.all).to(eq([definition1]))
  end 
end

describe('.find_by_word') do
  it("finds definitions for a word") do
    word1 = Word.new("easy", nil)
    word1.save()
    definition1 = Definition.new("without difficulty or effort", @word.id, nil)
    definition1.save()
    definition2 = Definition.new("free from worries or problems", word1.id, nil)
    definition2.save()
    expect(Definition.find_by_word(word1.id)).to(eq([definition2]))
  end
end

describe('#word') do
    it("finds the word the definitions belong to") do
      definition1 = Definition.new("without difficulty or effort", @word.id, nil)
      definition1.save()
      expect(definition1.word()).to(eq(@word))
    end
  end
end 