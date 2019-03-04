require 'sinatra'
require 'make_todo'

get '/' do
  erb :index
end

post '/create' do
  Tarea.create(params[:name])
	redirect '/'
end
