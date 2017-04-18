require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'
require_relative 'models/trainer'


# REDIRECT TO TRAINER INDEX
get '/' do
  redirect '/trainers'
end
# LIST OF TRAINERS - MAIN PAGE
get '/trainers' do
  @pokemons = Pokemon.all
  @trainers = Trainer.all
  erb :"trainers/index"
end
# SHOW INDIVIDUAL TRAINER
get '/trainers/:id' do
  @pokemons = Pokemon.all
  @trainer = Trainer.find(params[:id])
  erb :"trainers/show"
end
# GO TO 'ADD NEW TRAINER' PAGE
get '/trainers/new/' do
  erb :"trainers/new"
end
# BUTTON 'CREATE NEW TRAINER' ON NEW TRAINER VEIW
post '/trainers' do
  @trainer = Trainer.create(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end
# GO TO 'EDIT' PAGE
get "/trainers/:id/edit" do
  @trainer = Trainer.find(params[:id])
  erb :"trainers/edit"
end
#UPDATE BUTTON ON EDIT PAGE
put '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.update(params[:trainer])
  redirect "/trainers/#{@trainer.id}"
end
# DELETE TRAINER BUTTON FROM SHOW VIEW
delete '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect '/trainers'
end
# SHOW INDIVIDUAL POKEMON
get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end
# EDIT POKEMON
get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/edit"
end
