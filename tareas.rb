require 'sinatra'
require 'make_todo'

get '/' do
  @tareas = Tarea.all
  erb :index
end

post '/create' do
  Tarea.create("#{params[:name]}")
	redirect '/'
end

patch '/update/:id' do
  Tarea.update(params[:id])
  redirect '/'
end

delete '/delete/:id' do
  Tarea.destroy(params[:id])
  redirect '/'
end
