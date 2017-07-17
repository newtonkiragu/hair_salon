require('rspec')
require('pg')
require('client')
require('stylist')
require('pry')
require('capybara')

DB = PG.connect(:dbname => 'hair_salon_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end

end
