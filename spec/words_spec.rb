require 'rspec'
require 'words'


describe '#Word' do
  describe('.all') do
    it("it will return empty array") do 
      expect(Word.all).to(eq([]))
    end 
  end 



end 
