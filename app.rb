require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'
require_relative 'models/trainer'


get '/' do
  @trainers = Trainer.all
  erb :"trainers/index"
end

get '/add/' do
  erb :"trainers/add"
end

post '/trainers' do
  @trainer = Trainer.create(name: params[:name], id: params[:id], level: params[:level])
  redirect "/"
end

delete '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  @trainer.destroy
  redirect("/")
end

get '/trainers/:id' do
  @trainer = Trainer.find(params[:id])
  erb :"trainers/show"
end
