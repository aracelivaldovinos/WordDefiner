require('sinatra')
require('sinatra/reloader')
require('./lib/words')
require('./lib/definitions')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end 

get('/home') do
  @words = Word.all
  erb(:words)
end 

get('/home/new') do
  erb(:new_word)
end 

post('/home') do 
  word = Word.new(:word => paramswords_word)
  word.save()
  @word = word
  erb(:words)
end 




