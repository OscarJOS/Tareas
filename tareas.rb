require 'sinatra'
require 'make_todo'

get '/' do
  @tareas = Tarea.all
  erb :index
end

get '/A' do
  a = Array.new
  Tarea.all.each do |tarea|
    if tarea["done"] == false
      a.push(tarea)
    end
  end
  @tareas = a
  erb :index
end

get '/B' do
  a = Array.new
  Tarea.all.each do |tarea|
    if tarea["done"] == true
      a.push(tarea)
    end
  end
  @tareas = a
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
