require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload("lib/**/*.rb")
require("./lib/client")
require('pg')
require('pry')


DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  name = params.fetch("name")
  idnumber = params.fetch("idnumber")
  phonenumber = params.fetch("phonenumber")
  stylist = Stylist.new({:name => name, :id => nil, :idnumber => idnumber, :phonenumber => phonenumber})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

post("/clients") do
  name = params.fetch("name")
  phonenumber = params.fetch("phonenumber")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :phonenumber => phonenumber, :stylist_id => stylist_id})
  @client.save()
  erb(:success)
end
