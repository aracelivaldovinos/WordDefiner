require 'rspec'
require 'words'


describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it ("saves a Word") do
      word1 = Word.new("easy", nil)
      word1.save()
      word2 = Word.new("tough", nil)
      word2.save()
      expect(Word.all).to(eq([word1,word2]))
    end 
  end 
describe('#==') do
  it("is the same Word if it has the same attributes as another Word") do
    word1 = Word.new("easy", nil)
    word2 = Word.new("easy", nil)
    expect(word1).to(eq(word2))
  end
end
describe('.clear') do
  it("clears all Word") do
    word1 = Word.new("easy", nil)
    word1.save()
    word2 = Word.new("tough", nil)
    word2.save()
    Word.clear()
    expect(Word.all).to(eq([]))
  end
end

describe('.find') do
  it("finds an Word by id") do
    word1 = Word.new("easy", nil)
    word1.save()
    word2 = Word.new("tough", nil)
    word2.save()
    expect(Word.find(word1.id)).to(eq(word1))
  end
end

  describe('#update') do
    it("it will update word by id") do 
      word1 = Word.new("easy", 1)
      word1.save()
      word1.update("hard")
      expect(word1.word()).to(eq("hard"))
    end 
  end


  describe('#delete') do
  it("it will delete word by id") do 
    word1 = Word.new("easy", 1)
    word1.save()
    word2 = Word.new("hard", 2)
    word2.save()
    word1.delete()
    expect(Word.all).to(eq([word2]))
  end 
end


describe('#definitions') do
    it("returns word definitions") do
      word1 = Word.new("easy", nil)
      word1.save()
      definition1 = Definition.new("without difficulty or effort", word1.id, nil)
      definition1.save()
      definition2 = Definition.new("free from worries or problems", word1.id, nil)
      definition2.save()
      expect(word1.definitions).to(eq([definition1, definition2]))
    end
  end


end 