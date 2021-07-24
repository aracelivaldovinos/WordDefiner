require 'rspec'
require 'words'
require 'pry'


describe '#Word' do
before(:each) do
  Word.clear()
end
  describe('.all') do
    it("it will return empty array") do 
      expect(Word.all).to(eq([]))
    end 
  end 

  describe('#save') do
    it("it will save word in the @@word hash") do 
      word = Word.new({:word => "easy", :id => @id})
      word.save()
      expect(Word.all).to(eq([word]))
    end 
  end 

  describe('#==') do
    it("its the same word if it has the same attributes") do 
      word = Word.new({:word => "easy", :id => @id})
      word.save()
      word1 = Word.new({:word => "easy", :id => @id})
      word.save()
      expect(word).to(eq(word1))
    end 
  end 

  describe('.clear') do
    it("it will clear words hash") do 
      word = Word.new({:word => "easy", :id => @id})
      word.save()
      word1 = Word.new({:word => "easy", :id => @id})
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end 
  end

  ## Need to work on find and update
  describe('.find') do
    it("it will find word by id") do 
      word = Word.new({:word => "easy", :id => 1})
      word.save()
      word1 = Word.new({:word => "hard", :id => 2})
      word.save()
      expect(Word.find(word.id)).to(eq(word))
    end 
  end

  describe('#update') do
    it("it will update word by id") do 
      word = Word.new({:word => "easy", :id => 1})
      word.save()
      word.update("hard")
      expect(word.word()).to(eq("hard"))
    end 
  end

  ##

  describe('#delete') do
  it("it will delete word by id") do 
    word = Word.new({:word => "easy", :id => 1})
    word.save()
    word1 = Word.new({:word => "hard", :id => 2})
    word.save()
    word.delete()
    expect(Word.all).to(eq([word1]))
  end 
end

describe('#definitions') do
    it("returns an word definitions") do
      word = Word.new({:word => "easy", :id => @id})
      word.save()
      definition = Definition.new({:definition => "without difficulty or effort", :word_id => word.id, :id => 1})
      definition.save()
      definition1 = Definition.new({:definition => "free from worries or problems", :word_id => word.id, :id => 2})
      definition1.save()
      expect(word.definitions).to(eq([definition ,definition1]))
    end
  end

end 
