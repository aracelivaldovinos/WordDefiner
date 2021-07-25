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
  word = Word.new(params[:words_word], nil)
  word.save()
  @words = Word.all
  erb(:words)
end 

get('/home/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end




