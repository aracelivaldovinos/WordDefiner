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

get('/home/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post('/home') do 
  word = Word.new(params[:words_word], nil)
  word.save()
  @words = Word.all
  erb(:words)
end 

get('/home/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/home/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all
  erb(:word)
end

delete('/home/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end



## definition routhing 

get('/home/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end
post('/home/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_text], @word.id, nil)
  definition.save()
  erb(:word)
end
patch('/home/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end
delete('/home/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end




