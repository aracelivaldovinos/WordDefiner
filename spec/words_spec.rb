require 'rspec'
require 'words'


describe '#Word' do
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

end 
