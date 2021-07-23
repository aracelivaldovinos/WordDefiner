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

  describe('.find') do
    it("it will find word by id") do 
      word = Word.new({:word => "easy", :id => @id})
      word.save()
      word1 = Word.new({:word => "hard", :id => @id})
      word.save()
      binding.pry
      expect(Word.find(@id)).to(eq(word))
    end 
  end

end 
