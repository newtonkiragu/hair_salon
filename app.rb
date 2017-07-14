require('sinatra')
require('sinatra/reloader')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end
